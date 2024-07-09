{ config, inputs, pkgs, ... }:

{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  # boot.initrd.systemd.emergencyAccess = true;
  # boot.initrd.kernelModules = [ "uhid" "hid_sensor_als" "hid_sensor_trigger" "industrialio_triggered_buffer" "hid_sensor_iio_common" "industrialio" "hid_sensor_hub" "hid_multitouch" "i2c_hid_acpi" "i2c_hid" "mac_hid" "hid_generic" "usbhid" "hid" ];
  boot.initrd.unl0kr.enable = false;
  boot.plymouth.enable = true;

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
}
