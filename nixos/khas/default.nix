{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  zfsCompatibleKernelPackages = lib.filterAttrs (
    name: kernelPackages:
    (builtins.match "linux_[0-9]+_[0-9]+" name) != null
    && (builtins.tryEval kernelPackages).success
    && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
  ) pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in
{
  networking.hostName = "khas";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    # gaming
  ];

  # boot.kernelParams = [ "nohz_full=1-15" ];

  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [
    8000
    8080
  ];

  # boot.kernelModules = [ "zfs" ];
  environment.systemPackages = with pkgs; [
    zfs
  ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    zfs_unstable
  ];
  boot.kernelPackages = latestKernelPackage;

  virtualisation.waydroid.enable = true;
}
