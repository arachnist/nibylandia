{ config, lib, pkgs, ... }:

{
  options = {
    my.laptop.enable = lib.mkEnableOption "Laptop specific configuration";
  };

  config = lib.mkIf config.my.laptop.enable {
    services.tlp.enable = true;
    services.upower.enable = true;
    powerManagement = {
      enable = true;
      powertop.enable = true;
      cpuFreqGovernor = "ondemand";
    };
    programs.light.enable = true;
    services.fwupd.enable = true;
    services.fwupd.extraRemotes =
      [ "lvfs-testing" "vendor" "vendor-directory" ];
    services.fwupd.daemonSettings.OnlyTrusted = false;
    services.fwupd.package = (pkgs.fwupd.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or [ ])
        ++ [ ./disable-secureboot-checks.patch ];
    }));

    my.graphical.enable = lib.mkDefault true;
    my.boot.uefi.enable = lib.mkDefault true;
  };
}
