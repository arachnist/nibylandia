{ config, pkgs, lib, inputs, ... }:

{
  networking.hostName = "amanojaku";
  deployment.tags = [ "reachable-home" ];

  imports = with inputs.self.nixosModules; [
    graphical
    laptop

    inputs.jovian-nixos.nixosModules.default
  ];

  boot.uefi.enable = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_jovian;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3ccaa83b-c3a3-478e-aa79-5310cf344c93";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9C71-46C1";
    fsType = "vfat";
  };

  services.displayManager.sddm.enable = lib.mkForce false;

  hardware.pulseaudio.enable = lib.mkForce false;
  jovian.devices.steamdeck.enable = true;

  environment.systemPackages = with pkgs; [ maliit-keyboard maliit-framework ];
  i18n.inputMethod.enabled = lib.mkForce "fcitx5";
  i18n.inputMethod.fcitx5 = {
    addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-gtk
      libsForQt5.fcitx5-qt
    ];
  };

  jovian.steam = {
    enable = true;
    autoStart = true;
    desktopSession = "plasma";
    user = "ar";
  };

  jovian.decky-loader.user = "ar";

  age.secrets.ar-password.file = ../../secrets/amanojaku-ar.age;
  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;
}
