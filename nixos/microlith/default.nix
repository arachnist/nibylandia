{ config, pkgs, lib, ... }:

{
  networking.hostName = "microlith";
  deployment.targetHost = "microlith.nibylandia.lan";

  imports = [ ./hardware-configuration.nix ];
  age.secrets.ar-password.file = ../../secrets/microlith-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
