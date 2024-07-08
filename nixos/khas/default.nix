{ config, inputs, ... }:

{
  networking.hostName = "khas";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    gaming
  ];

  # boot.kernelParams = [ "nohz_full=1-15" ];

  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
