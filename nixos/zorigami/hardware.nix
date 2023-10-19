{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.zfs.extraPools = [ "tank" ];
  boot.zfs.enableUnstable = true;
  boot.supportedFilesystems = [ "zfs" ];

  boot.ryzen.enable = true;

  networking.hostId = "7999af7c";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2c034d00-d937-498c-85af-088616b8449c";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C1BA-34FE";
    fsType = "vfat";
  };

  fileSystems."/home/minecraft/survival/world" = {
    device = "survivalworld";
    fsType = "tmpfs";
    options = [ "mode=755" "uid=1001" "gid=100" "size=40G" ];
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/86fee886-bdba-4f0b-8fe6-31c32e8232fa"; }];

}
