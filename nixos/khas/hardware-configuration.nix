_:

{
  hardware.enableAllFirmware = true;
  boot.ryzen.enable = true;

  boot.initrd.availableKernelModules = [
    "nvme"
    "ehci_pci"
    "xhci_pci"
    "rtsx_pci_sdmmc"
  ];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/71BA-5645";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=8G"
      "mode=755"
    ];
  };

  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/7b8a30a7-3ef9-46a5-afcb-0442272b6db0";

  fileSystems."/nix" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/etc/ssh" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=etc_ssh" ];
      neededForBoot = true;
    };

  fileSystems."/etc/NetworkManager" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=etc_NetworkManager" ];
    };

  fileSystems."/etc/nixos" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=etc_nixos" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_log" ];
    };

  fileSystems."/var/lib/NetworkManager" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_NetworkManager" ];
    };

  fileSystems."/var/lib/bluetooth" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_bluetooth" ];
    };

  fileSystems."/var/lib/libvirt" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_libvirt" ];
    };

  fileSystems."/var/lib/flatpak" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_flatpak" ];
    };

  fileSystems."/var/lib/tpm" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_tpm" ];
    };

  fileSystems."/var/lib/tailscale" =
    { device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=var_lib_tailscale" ];
    };

  swapDevices = [ ];
}
