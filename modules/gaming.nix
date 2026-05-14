{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraPackages = with pkgs; [
      hidapi
    ];
  };

  environment.systemPackages = with pkgs; [
    hidapitester
    ryubing
    steamtinkerlaunch
    gamescope
    gamescope-wsi
  ];
}
