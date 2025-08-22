{ pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.zfs.extraPools = [ "tank" ];
  boot.zfs.package = pkgs.zfs_unstable;
  boot.supportedFilesystems = [ "zfs" ];

  boot.ryzen.enable = true;

  networking.hostId = "7999af7c";

  systemd.services.systemd-udev-settle.enable = false;
  boot.initrd.systemd.enable = true;
  boot.initrd.luks.devices."nixos".device =
    "/dev/disk/by-uuid/02f38fdc-1922-41a1-a313-41cd67ba78cc";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f519d312-ea95-4a51-8529-96d0449d02cd";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/12CE-A600";
    fsType = "vfat";
  };

  fileSystems."/home/minecraft/survival/world" = {
    device = "survivalworld";
    fsType = "tmpfs";
    options = [ "mode=755" "uid=1001" "gid=100" "size=40G" ];
  };
}
