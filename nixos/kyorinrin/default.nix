{ config, inputs, pkgs, ... }:

{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    gaming
  ];

  age.secrets.ar-password.file = ../../secrets/kyorinrin-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework

    iio-sensor-proxy
    xournalpp
  ];
}
