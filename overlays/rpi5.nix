self: super: {
  linux_rpi5 = self.callPackage ../pkgs/linux_rpi/linux-rpi.nix {
    kernelPatches = with self.kernelPatches; [
      bridge_stp_helper
      request_key_helper
    ];
    rpiVersion = 5;
  };

  linuxPackages_rpi5 = self.linuxPackagesFor linux_rpi5;
}
