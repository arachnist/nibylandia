{ config, pkgs, lib, inputs, ... }:

{
  networking.hostName = "amanojaku";

  imports = with inputs.self.nixosModules; [
    graphical
    laptop

    inputs.jovian-nixos.nixosModules.default
  ];
  
  boot.uefi.enable = true;
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/34409a0d-48ac-4dcb-8fe2-ac553b5b27f1";
    fsType = "ext4";
   };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3906-F639";
    fsType = "vfat";
  };
  
  services.xserver.displayManager.sddm.enable = lib.mkForce false;
  services.xserver.desktopManager.plasma5 = {
    mobile.enable = true;
    mobile.installRecommendedSoftware = true;
  };
  
  hardware.pulseaudio.enable = lib.mkForce false;
  
  jovian.steam = {
    enable = true;
    autoStart = true;
    desktopSession = "plasmawayland";
    user = "ar";
  };

  jovian.decky-loader.user = "ar";
  
  jovian.devices.steamdeck.enable = true;
}
