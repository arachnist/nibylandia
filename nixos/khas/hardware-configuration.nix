{ config, lib, pkgs, modulesPath, ... }:

{
  # imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "nvme" "ehci_pci" "xhci_pci" "rtsx_pci_sdmmc" ];

  boot.initrd.luks.devices."nixos".device =
    "/dev/disk/by-uuid/f676b705-5ae7-4f71-abf9-b1aac0ac2363";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1FA4-9D1F";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=8G" "mode=755" ];
  };

  fileSystems."/tmp" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=tmp" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=home" ];
  };

  fileSystems."/etc/NetworkManager" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=etc_NetworkManager" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_log" ];
  };

  fileSystems."/var/lib/NetworkManager" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_lib_NetworkManager" ];
  };

  fileSystems."/var/lib/bluetooth" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_lib_bluetooth" ];
  };

  fileSystems."/var/lib/libvirt" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_lib_libvirt" ];
  };

  fileSystems."/var/lib/flatpak" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_lib_flatpak" ];
  };

  fileSystems."/var/lib/tpm" = {
    device = "/dev/disk/by-uuid/364a4679-1512-4b57-9f31-a4dc4fd192b1";
    fsType = "btrfs";
    options = [ "subvol=var_lib_tpm" ];
  };

}
