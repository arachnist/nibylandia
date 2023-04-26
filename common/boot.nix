{ config, lib, pkgs, ... }:

let cfg = config.my.boot;
in {
  options = {
    my.boot.uefi.enable = lib.mkEnableOption "Boot via UEFI";
    my.boot.ryzen.enable =
      lib.mkEnableOption "Enable AMD Ryzen-specific options";
    my.boot.secureboot.enable = lib.mkEnableOption "Enable secureboot";
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
    (lib.mkIf cfg.secureboot.enable {
      boot.loader.secureboot = {
        enable = true;
        signingKeyPath = "/home/ar/secureboot-v2/DB.key";
        signingCertPath = "/home/ar/secureboot-v2/DB.crt";
      };
      my.boot.uefi.enable = lib.mkForce false;
    })
    { boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest; }
  ];
}
