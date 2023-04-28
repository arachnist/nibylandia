{ config, lib, pkgs, ... }:

let cfg = config.my.gaming-client;
in {
  options.my.gaming-client = { enable = lib.mkEnableOption "Gaming client"; };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
