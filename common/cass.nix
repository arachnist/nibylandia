{ config, lib, pkgs, ... }:

let cfg = config.my.cass;
in {
  options.my.cass = {
    enable =
      lib.mkEnableOption "Enable content-addressable link posting server";
    listen = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1:8000";
      description = "Port to listen on";
    };
    fileStore = lib.mkOption {
      type = lib.types.str;
      description = "Directory to store uploaded files in";
    };
    urlBase = lib.mkOption {
      type = lib.types.str;
      description = "Url prefix for served files";
    };
    domain = lib.mkOption {
      type = lib.types.str;
      description = "Domain on which to expose the /up and /down endpoints";
    };
    authFileLocation = lib.mkOption {
      type = lib.types.str;
      description = "Location of the basic auth file";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.cass = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "cass";
      serviceConfig = {
        Type = "simple";
        User = "ar";
        ExecStart = ''
          ${pkgs.cass}/bin/cass -listen "${cfg.listen}" -file-store "${cfg.fileStore}" -url-base "${cfg.urlBase}"'';
      };
    };

    services.nginx.virtualHosts.${cfg.domain}.locations = {
      "/up" = {
        proxyPass = "http://${cfg.listen}";
        basicAuthFile = cfg.authFileLocation;
        extraConfig = ''
          proxy_request_buffering off;
          proxy_send_timeout "9000s";
          proxy_read_timeout "9000s";
        '';
      };
      "/down" = {
        proxyPass = "http://${cfg.listen}";
        basicAuthFile = cfg.authFileLocation;
        extraConfig = ''
          proxy_request_buffering off;
          proxy_send_timeout "9000s";
          proxy_read_timeout "9000s";
        '';
      };
    };
  };
}
