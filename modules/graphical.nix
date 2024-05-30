{ config, lib, pkgs, inputs, ... }:

let
  flakes = lib.filterAttrs (name: value: value ? outputs) inputs;
  nixRegistry = builtins.mapAttrs (name: v: { flake = v; }) flakes;
  # rfkill block 0; rmmod btusb btintel; systemctl restart bluetooth.service; modprobe btintel; modprobe btusb; systemctl restart bluetooth.service; rfkill unblock 0
  bt-unfuck = with pkgs;
    writeScriptBin "bt-unfuck" ''
      #!${runtimeShell}
      ${util-linux}/bin/rfkill block 0
      ${kmod}/bin/rmmod btusb btintel
      ${systemd}/bin/systemctl restart bluetooth.service
      for mod in btintel btusb; do
        ${kmod}/bin/modprobe $mod
      done
      ${systemd}/bin/systemctl restart bluetooth.service
      ${util-linux}/bin/rfkill unblock 0
    '';
in {
  imports = [ inputs.self.nixosModules.common inputs.home-manager.nixosModule ];

  nix.registry = nixRegistry;

  home-manager.users.ar = {
    home.username = "ar";
    home.homeDirectory = "/home/ar";
    home.stateVersion = config.system.stateVersion;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

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

  home-manager.users.ar.services.easyeffects.enable = true;

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "wpa_supplicant";
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart =
    lib.mkForce [ "" "${pkgs.networkmanager}/bin/nm-online" ];

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

  security.wrappers.bt-unfuck = {
    setuid = true;
    owner = "root";
    group = "root";
    source = "${bt-unfuck}/bin/bt-unfuck";
  };

  services.desktopManager.plasma6.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    xkb.options = "ctrl:nocaps";
  };

  services.libinput.enable = true;
  services.displayManager = {
    sddm = {
      enable = lib.mkDefault true;
      wayland.enable = true;
      settings.Wayland.SessionDir =
        "/run/current-system/sw/share/wayland-sessions";
      settings.X11.SessionDir = lib.mkForce "";
    };
    defaultSession = "plasma";
  };

  boot = {
    loader.timeout = 0;
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    plymouth.enable = true;
    plymouth.theme = "breeze";
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
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
    enabled = lib.mkDefault "ibus";
    ibus.engines = with pkgs.ibus-engines; [ uniemoji ];
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [ cups-dymo ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.flatpak.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
    adb.enable = true;
    fuse.userAllowOther = true;
    dconf.enable = true;
    mosh.enable = true;
    kdeconnect.enable = true;
    sway.enable = true;
    hyprland.enable = true;
    firefox = {
      enable = true;
      #nativeMessagingHosts.packages = with pkgs; [
      #  browserpass
      #  plasma-browser-integration
      #];
    };
  };

  nixpkgs.config = { joypixels.acceptLicense = true; };

  environment.sessionVariables = { MOZ_ENABLE_WAYLAND = "1"; };

  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ] ++ (with pkgs; [
    krfb # for kdeconnect virtual display
    chromium
    # electrum
    ffmpeg-full
    firefox
    imagemagick
    inkscape
    kate
    keybase-gui
    kolourpaint
    nixfmt-classic
    okular
    paprefs
    pavucontrol
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
    neochat
    vagrant
    vokoscreen-ng
    appimage-run
    protonup-ng
    scrcpy
    krita
    vlc
    libreoffice-qt
    tokodon

    glasgow
    freecad

    easyeffects

    nixd
    clang-tools
    python3Packages.python-lsp-server
    yaml-language-server

    (signal-desktop.overrideAttrs (old: {
      preFixup = ''
        gappsWrapperArgs+=(
          --add-flags "--enable-features=UseOzonePlatform"
          --add-flags "--ozone-platform=wayland"
        )
      '' + old.preFixup;
    }))

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
    # TODO: investigate later
    # orca-slicer
    # super-slicer-beta

    deploy-rs
    go
    pry
    sshfs
    dig
    whois
    cfssl
    gomuks
    bind
    nmap
    colmena
    waypipe
  ]);
}
