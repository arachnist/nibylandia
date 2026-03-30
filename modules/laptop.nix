{ pkgs, ... }:

{
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
  };
  hardware.acpilight.enable = true;
  services.fwupd.enable = true;
  services.fwupd.extraRemotes = [
    "lvfs-testing"
    "vendor"
    "vendor-directory"
  ];
  services.fwupd.daemonSettings.OnlyTrusted = false;
  environment.systemPackages = [ pkgs.brightnessctl ];
}
