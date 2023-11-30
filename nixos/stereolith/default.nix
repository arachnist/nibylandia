{ inputs, ... }:

{
  networking.hostName = "stereolith";
  networking.hostId = "adcad022";

  imports = with inputs.self.nixosModules; [ common secureboot ];

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "zfs" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/34409a0d-48ac-4dcb-8fe2-ac553b5b27f1";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3906-F639";
    fsType = "vfat";
  };

  nix.settings.max-jobs = 16;

  hardware.enableRedistributableFirmware = true;
}
