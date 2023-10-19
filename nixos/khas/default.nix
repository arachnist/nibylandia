{ config, pkgs, lib, ... }:

{
  networking.hostName = "khas";
  deployment.targetHost = "khas.nibylandia.lan";

  imports = [ ./hardware-configuration.nix ];
  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
