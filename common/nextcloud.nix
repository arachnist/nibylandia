{ config, lib, pkgs, ... }:

let cfg = config.my.nextcloud;
in {
  options = {
    my.nextcloud = {
      enable = lib.mkEnableOption "Enable nextcloud";
      package = lib.mkOption {
        type = lib.types.package;
        description = "Nextcloud package to use";
        default = pkgs.nextcloud26;
      };
      domain = lib.mkOption {
        type = lib.types.str;
        description = "Domain name for nextcloud instance";
      };
      adminSecret = lib.mkOption {
        type = lib.types.str;
        description = "Path to nextcloud admin user password file";
      };
      exporterSecret = lib.mkOption {
        type = lib.types.str;
        description = "Path to nextcloud exporter user password file";
      };
      dbHost = lib.mkOption {
        type = lib.types.str;
        description = "Database host";
        default = "/run/postgresql";
      };
      autoUpdateAppsSchedule = lib.mkOption {
        type = lib.types.str;
        description = "When to start nextcloud app autoupdate";
        default = "05:00:00";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.nextcloud = {
      enable = true;
      package = cfg.package;
      hostName = cfg.domain;
      autoUpdateApps.enable = true;
      autoUpdateApps.startAt = cfg.autoUpdateAppsSchedule;

      config = {
        overwriteProtocol = "https";

        adminuser = "admin";
        adminpassFile = cfg.adminSecret;

        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbname = "nextcloud";
        dbhost = cfg.dbHost;
      };
    };

    services.nginx.virtualHosts.${cfg.domain} = {
      forceSSL = true;
      enableACME = true;
    };

    services.prometheus.exporters.nextcloud = {
      enable = true;
      username = "admin";
      passwordFile = cfg.exporterSecret;
      url = "https://${cfg.domain}";
      listenAddress = "127.0.0.1";
    };

    services.postgresql.ensureDatabases = [ "nextcloud" ];
    services.postgresql.ensureUsers = [{
      name = "nextcloud";
      ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
    }];

    systemd.services."nextcloud-setup" = {
      requires = [ "postgresql.service" ];
      after = [ "postgresql.service" ];
    };
  };
}
