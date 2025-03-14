{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    ryujinx
    steamtinkerlaunch
    gamescope
    gamescope-wsi
  ];
}
