_:

{
  hardware.enableAllFirmware = true;
  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "uas" "sd_mod" ];

  boot.kernelParams = [ "pci=realloc,assign-busses,hpbussize=0x33" ];
  services.hardware.bolt.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/71eb7f26-3872-45cc-8456-c801ab342017";
    fsType = "xfs";
  };

  fileSystems."/steam" = {
    device = "/dev/disk/by-uuid/a2b3af5e-b15b-4023-8f8f-ea828b8df241";
    fsType = "xfs";
  };

  boot.initrd.luks.devices."microlith".device =
    "/dev/disk/by-uuid/3b53f78f-4d3f-4b3b-b7c8-640fe450f122";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F0CC-B537";
    fsType = "vfat";
  };
}
