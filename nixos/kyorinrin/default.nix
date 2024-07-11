{ config, inputs, pkgs, ... }:

let
  pkgsOlder = import inputs.nixpkgsOlder { system = pkgs.system; config.allowUnfree = true; };
in
{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  services.fprintd.enable = true;

  age.secrets.ar-password.file = ../../secrets/kyorinrin-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework

    iio-sensor-proxy
    xournalpp
  ];

  services.displayManager.sddm.settings.Fingerprintlogin = {
    Session = "plasma";
    User = "ar";
  };
}
