{ config, lib, pkgs, ... }:

{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    extraModprobeConfig = ''
      options v4l2loopback devices=4 exclusive_caps=1
    '';
    kernel.sysctl = { "vm.swappiness" = 160; };
  };

  zramSwap.enable = true;

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    pulse.enable = true;
  };

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "wpa_supplicant";
  hardware.glasgow.enable = true;
  hardware.nitrokey.enable = true;
  hardware.steam-hardware.enable = true;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.xserver = {
    enable = true;
    desktopManager.plasma5 = {
      enable = true;
      runUsingSystemd = true;
    };
    displayManager = {
      sddm = {
        enable = true;
        # sadly, not working correctly on khas?
        # wayland.enable = true;
        settings.Wayland.SessionDir =
          "/run/current-system/sw/share/wayland-sessions";
        settings.X11.SessionDir = lib.mkForce "";
      };
      defaultSession = "plasmawayland";
    };

    layout = "pl";
    xkbOptions = "ctrl:nocaps";
    libinput.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
      terminus_font
      terminus_font_ttf
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-emoji-blob-bin
      joypixels
      twemoji-color-font
      carlito
      meslo-lgs-nf
      fira-code
      fira-code-symbols
    ];
  };

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ uniemoji ];
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [ cups-dymo ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  services.flatpak.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    adb.enable = true;
    fuse.userAllowOther = true;
    dconf.enable = true;
    mosh.enable = true;
    kdeconnect.enable = true;
    sway.enable = true;
    hyprland.enable = true;
  };

  nixpkgs.config = {
    firefox = {
      enablePlasmaBrowserIntegration = true;
      enableBrowserpass = true;
    };
    joypixels.acceptLicense = true;
  };

  environment.systemPackages = with pkgs; [
    chromium
    electrum
    ffmpeg-full
    firefox
    imagemagick
    inkscape
    kate
    keybase-gui
    kolourpaint
    nixfmt
    okular
    paprefs
    pavucontrol
    (signal-desktop.overrideAttrs (old: {
      preFixup = (old.preFixup or "")
        + "  gappsWrapperArgs+=(\n    --add-flags --use-tray-icon\n  )\n";
    }))
    solvespace
    spotify
    youtube-dl
    morph
    mpv
    gphoto2
    minicom
    maim
    thunderbird
    feh
    virt-manager
    cura
    ncdu
    nixos-option
    yt-dlp
    lsix
    element-desktop
    oneko
    cinny-desktop
    vagrant
    vokoscreen-ng
    appimage-run
    protonup-ng
    scrcpy
    krita
    vlc
    # mastodon-update-script
    libreoffice-qt
    tokodon

    glasgow
    freecad

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        bierner.emojisense
        bierner.markdown-checkbox
        bierner.markdown-emoji
        bodil.file-browser
        golang.go
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        ms-vscode.anycode
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        ms-vscode.makefile-tools
        redhat.vscode-yaml
        rust-lang.rust-analyzer
        shardulm94.trailing-spaces
        arrterian.nix-env-selector
        jnoortheen.nix-ide
      ];
    })

    prusa-slicer
  ];
}
