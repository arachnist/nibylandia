{ config, inputs, ... }:

{
  networking.hostName = "microlith";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    gaming
    secureboot
  ];
  age.secrets.ar-password.file = ../../secrets/microlith-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
