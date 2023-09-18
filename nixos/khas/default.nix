{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nibylandia-boot.ryzen.enable = true;

  virtualisation.docker = { enable = true; };

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
