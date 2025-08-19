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

  boot.initrd.luks.devices."nixos".device =
    "/dev/disk/by-uuid/117206f8-160b-4c4f-83be-f4d90c1a8458";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/95f0c018-2f91-47de-8db5-6b6250ee4e8e";
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
