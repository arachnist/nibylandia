{ config, lib, pkgs, ... }:

let
  cfg = config.nibylandia.monitoring-server;
  grafana = config.services.grafana.settings.server;
  filterValidPrometheus =
    filterAttrsListRecursive (n: v: !(n == "_module" || v == null));
  filterAttrsListRecursive = pred: x:
    if lib.isAttrs x then
      lib.listToAttrs (lib.concatMap (name:
        let v = x.${name};
        in if pred name v then
          [ (lib.nameValuePair name (filterAttrsListRecursive pred v)) ]
        else
          [ ]) (lib.attrNames x))
    else if lib.isList x then
      map (filterAttrsListRecursive pred) x
    else
      x;
  writePrettyJSON = name: x:
    pkgs.runCommandLocal name { } ''
      echo '${builtins.toJSON x}' | ${pkgs.jq}/bin/jq . > $out
    '';
  vmConfig = {
    scrape_configs =
      filterValidPrometheus config.services.prometheus.scrapeConfigs;
  };
  generatedPrometheusYml = writePrettyJSON "prometheus.yml" vmConfig;
  getEnabled = x:
    lib.concatMap (name:
      let v = x.${name};
      in if (!builtins.elem name [ "minio" "tor" ]) && builtins.typeOf v
      == "set" && v.enable then
        [ v ]
      else
        [ ]) (lib.attrNames x);
  # TODO: add some magic to configure endpoints for all the other exporters
  localExporterEndpoints =
    map (x: x.listenAddress + ":" + builtins.toString x.port)
    (getEnabled config.services.prometheus.exporters);
in {
  options = {
    nibylandia.monitoring-server = {
      domain = lib.mkOption {
        type = lib.types.str;
        description = "External domain for monitoring services";
      };
    };
  };

  config = {
    services.victoriametrics = {
      enable = true;
      retentionPeriod = "1y";
      listenAddress = ":8428";
      extraOptions = [
        "-selfScrapeInterval=10s"
        "-promscrape.config=${generatedPrometheusYml}"
      ];
    };

    services.grafana.enable = true;

    services.grafana.settings = {
      server = {
        http_addr = "127.0.0.1";
        inherit (cfg) domain;
      };
      database = {
        user = "grafana";
        type = "postgres";
        host = "/run/postgresql";
      };
    };

    services.postgresql.ensureDatabases = [ "grafana" ];
    services.postgresql.ensureUsers = [{
      name = "grafana";
      ensureDBOwnership = true;
    }];

    services.prometheus.exporters = {
      node = {
        enable = true;
        listenAddress = "127.0.0.1";
        enabledCollectors = [ "systemd" ];
      };
      smokeping = {
        enable = true;
        pingInterval = "300ms";
        listenAddress = "127.0.0.1";
        hosts = [
          "i.am-a.cat"
          "customs.waw.hackerspace.pl"
          "edge01.waw.bgp.wtf"
          "1.1.1.1"
          "185.236.240.143"
        ];
      };
    };

    services.prometheus.scrapeConfigs = [
      {
        job_name = "local_exporters";
        scrape_interval = "10s";
        static_configs = [{ targets = localExporterEndpoints; }];
      }
      {
        job_name = "spejsiot";
        metrics_path = "/metrics/spejsiot";
        scrape_interval = "10s";
        static_configs = [{ targets = [ "customs.hackerspace.pl" ]; }];
      }
    ];
    services.nginx.virtualHosts.${cfg.domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass =
          "http://${grafana.http_addr}:${builtins.toString grafana.http_port}";
        proxyWebsockets = true;
      };
    };
  };
}
