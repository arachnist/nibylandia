{ config, lib, pkgs, ... }:

let cfg = config.my.vaultwarden;
in {
  options = {
    my.vaultwarden = {
      enable = lib.mkEnableOption "Enable vaultwarden";
      domain = lib.mkOption { type = lib.types.str; };
      port = lib.mkOption { type = lib.types.str; };
      smtpHost = lib.mkOption { type = lib.types.str; };
      smtpUser = lib.mkOption { type = lib.types.str; };
      smtpPasswordFile = lib.mkOption { type = lib.types.str; };
    };
  };

  config = lib.mkIf cfg.enable {
    services.vaultwarden = {
      enable = true;
      dbBackend = "postgresql";
      config = {
        DOMAIN = "https://${toString cfg.domain}";
        ROCKET_PORT = cfg.port;
        ROCKET_ADDRESS = "127.0.0.1";
        databaseUrl =
          "postgresql://vaultwarden@%2Frun%2Fpostgresql/vaultwarden";

        smtpHost = "is-a.cat";
        smtpFrom = cfg.smtpUser;
        smtpUsername = cfg.smtpUser;
        smtpSecurity = "force_tls";

        signupsDomainsWhitelist = "is-a.cat";
      };
      environmentFile = cfg.smtpPasswordFile;
    };

    services.nginx.virtualHosts.${cfg.domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${
            toString config.services.vaultwarden.config.ROCKET_PORT
          }";
        proxyWebsockets = true;
      };
      locations."/notifications/hub" = {
        proxyPass = "http://localhost:3012";
        proxyWebsockets = true;
      };
      locations."/notifications/hub/negotiate" = {
        proxyPass = "http://localhost:8812";
        proxyWebsockets = true;
      };
    };

    services.postgresql.ensureDatabases = [ "vaultwarden" ];
    services.postgresql.ensureUsers = [{
      name = "vaultwarden";
      ensurePermissions."DATABASE \"vaultwarden\"" = "ALL PRIVILEGES";
    }];
  };
}
