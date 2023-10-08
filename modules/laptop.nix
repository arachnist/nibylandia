{ config, lib, pkgs, ... }:

{
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
  };
  programs.light.enable = true;
  services.fwupd.enable = true;
  services.fwupd.extraRemotes = [ "lvfs-testing" "vendor" "vendor-directory" ];
  services.fwupd.daemonSettings.OnlyTrusted = false;
}
