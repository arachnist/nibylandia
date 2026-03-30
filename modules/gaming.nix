{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    ryubing
    steamtinkerlaunch
    gamescope
    gamescope-wsi
  ];
}
