{ config, pkgs, lib, ... }:

{
  networking.hostName = "khas";
  imports = [ ./hardware-configuration.nix ];
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
