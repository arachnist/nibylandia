{ config, lib, pkgs, ... }:

{
  microvm = {
    hypervisor = "cloud-hypervisor";
    graphics.enable = true;
    interfaces = [{
      id = "vm-element";
      type = "tap";
      mac = "00:00:00:00:00:02";
    }];
    storeDiskType = "erofs";
    writableStoreOverlay = "/nix/.rw-store";
    volumes = [{
      image = "nix-store-overlay.img";
      mountPoint = config.microvm.writableStoreOverlay;
      size = 2048;
    }];
  };

  networking.hostName = "graphical-microvm";
  system.stateVersion = "23.11";

  services.getty.autologinUser = "user";
  users.users.user = {
    password = "";
    group = "user";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };
  users.groups.user = { };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  environment.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-1";
    DISPLAY = ":0";
    QT_QPA_PLATFORM = "wayland"; # Qt Applications
    GDK_BACKEND = "wayland"; # GTK Applications
    XDG_SESSION_TYPE = "wayland"; # Electron Applications
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    ECORE_EVAS_ENGINE = "wayland-egl";
    ELM_ENGINE = "wayland_egl";
    NO_AT_BRIDGE = "1";
    BEMENU_BACKEND = "wayland";
  };

  systemd.user.services.wayland-proxy = {
    enable = true;
    description = "Wayland Proxy";
    serviceConfig = with pkgs; {
      # Environment = "WAYLAND_DISPLAY=wayland-1";
      ExecStart =
        "${wayland-proxy-virtwl}/bin/wayland-proxy-virtwl --virtio-gpu --x-display=0 --xwayland-binary=${xwayland}/bin/Xwayland";
      Restart = "on-failure";
      RestartSec = 1;
    };
    wantedBy = [ "default.target" ];
  };

  environment.systemPackages = with pkgs;
    [
      xdg-utils # Required
    ] ++ [ element-desktop ];

  hardware.opengl.enable = true;
}
