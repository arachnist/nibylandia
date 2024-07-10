_:

{
  hardware.enableAllFirmware = true;
  boot.ryzen.enable = true;

  boot.initrd.availableKernelModules =
    [ "nvme" "ehci_pci" "xhci_pci" "rtsx_pci_sdmmc" ];

  boot.initrd.luks.devices."nixos".device =
    "/dev/disk/by-uuid/069a58b9-d8c1-4ab1-8a68-c45928045f9b";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/12CE-A600";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=8G" "mode=755" ];
  };

  fileSystems."/tmp" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=tmp" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=home" ];
  };

  fileSystems."/steam" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=steam" ];
  };

  fileSystems."/etc/ssh" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=etc_ssh" ];
    neededForBoot = true;
  };

  fileSystems."/etc/NetworkManager" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=etc_NetworkManager" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_log" ];
  };

  fileSystems."/var/lib/NetworkManager" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_NetworkManager" ];
  };

  fileSystems."/var/lib/bluetooth" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_bluetooth" ];
  };

  fileSystems."/var/lib/libvirt" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_libvirt" ];
  };

  fileSystems."/var/lib/flatpak" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_flatpak" ];
  };

  fileSystems."/var/lib/tpm" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_tpm" ];
  };

  fileSystems."/var/lib/alsa" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_alsa" ];
  };

  fileSystems."/var/lib/tailscale" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_tailscale" ];
  };

  fileSystems."/var/lib/fprint" = {
    device = "/dev/disk/by-uuid/82037b18-0f09-4383-8238-8e3396af30a3";
    fsType = "btrfs";
    options = [ "subvol=var_lib_fprint" ];
  };
}
