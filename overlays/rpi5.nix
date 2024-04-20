self: super: rec {
  linux_rpi5 = self.callPackage ../pkgs/linux_rpi/linux-rpi.nix {
    kernelPatches = with self.kernelPatches; [
      bridge_stp_helper
      request_key_helper
    ];
    rpiVersion = 5;
  };

  linuxPackages_rpi5 = self.linuxPackagesFor linux_rpi5;

  rpi5-arm-tf = self.callPackage ../pkgs/rpi5-arm-tf.nix { };
  rpi5-edk2-tools = self.callPackage ../pkgs/rpi5-edk2-tools.nix { };
  rpi5-uefi = self.callPackage ../pkgs/rpi5-uefi.nix { };
  rpi5-uefi-bin = self.callPackage ../pkgs/rpi5-uefi-bin.nix { };
}
