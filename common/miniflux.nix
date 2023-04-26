{ config, lib, pkgs, ... }:

let cfg = config.my.miniflux;
in {
  options = {
    my.miniflux = {
      enable = lib.mkEnableOption "Enable miniflux";
      adminCredentialsFile = lib.mkOption { type = lib.types.path; };
      listenAddress = lib.mkOption { type = lib.types.str; };
      domain = lib.mkOption { type = lib.types.str; };
    };
  };

  config = lib.mkIf cfg.enable {
    services.miniflux = {
      enable = true;
      adminCredentialsFile = cfg.adminCredentialsFile;
      config = { LISTEN_ADDR = cfg.listenAddress; };
    };

    services.nginx.virtualHosts.${cfg.domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = { proxyPass = "http://" + cfg.listenAddress; };
    };
  };
}
