{ config, lib, pkgs, ... }:

{
  options = {
    my.irc.enable = lib.mkEnableOption "Enable irc configuration";
    my.irc.domain = lib.mkOption {
      type = lib.types.str;
      description = "Domain for glowingbear";
    };
  };

  config = lib.mkIf config.my.irc.enable {
    environment.systemPackages = with pkgs; [ weechat ];

    services.nginx.virtualHosts.${config.my.irc.domain} = {
      forceSSL = true;
      enableACME = true;
      locations."^~ /weechat" = {
        proxyPass = "http://127.0.0.1:9001";
        proxyWebsockets = true;
      };
      locations."/" = { root = pkgs.glowing-bear; };
    };

    services.oidentd.enable = true;
    networking.firewall.allowedTCPPorts = [ 113 ];
  };
}
