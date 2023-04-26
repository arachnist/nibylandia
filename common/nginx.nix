{ config, secrets, lib, pkgs, ... }:

{
  options.my.nginx.enable =
    lib.mkEnableOption "Enable nginx with some sane defaults";

  config = lib.mkIf config.my.nginx.enable {
    services.nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      clientMaxBodySize = "4096m";
      appendHttpConfig = ''
        disable_symlinks off;
      '';
    };

    security.acme.acceptTerms = true;
    security.acme.defaults.email = config.my.secrets.userDB.ar.email;

    networking.firewall.allowedTCPPorts = [ 80 443 ];
    networking.firewall.allowedUDPPorts = [ 80 443 ];
  };
}
