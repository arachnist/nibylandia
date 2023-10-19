{ config, lib, pkgs, ... }:

let cfg = config.boot;
in {
  options.boot = {
    uefi.enable = lib.mkEnableOption "Boot via UEFI";
    ryzen.enable = lib.mkEnableOption "Enable AMD Ryzen-specific options";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.uefi.enable {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })
    (lib.mkIf cfg.ryzen.enable {
      boot = {
        extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
        blacklistedKernelModules = [ "k10temp" ];
        kernelModules = [ "zenpower" "kvm-amd" ];
      };
    })
    { boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest; }
  ];
}
