{ config, lib, pkgs, ... }:

let
  # artifact; not required anymore
  workingNerdfonts = lib.filter (x: x != "IBMPlexMono")
    (builtins.attrNames (import <nixpkgs/pkgs/data/fonts/nerdfonts/shas.nix>));
in {
  options = {
    my.graphical.enable =
      lib.mkEnableOption "Configuration specific for graphical machines";
  };

  config = lib.mkIf config.my.graphical.enable {
    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
      extraModprobeConfig = ''
        options v4l2loopback devices=4 exclusive_caps=1
      '';
      plymouth = {
        enable = false;
        theme = "breeze";
      };
      initrd.systemd.enable = true;
    };

    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "wpa_supplicant";
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
      enableDefaultFonts = true;
      fonts = with pkgs; [
        # (nerdfonts.override { fonts = workingNerdfonts; })
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

    users.users.ar = {
      extraGroups = [
        "video"
        "dialout" # usb serial adapters
        "networkmanager"
      ];
    };

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
      sway = { enable = true; };
    };

    environment.systemPackages = with pkgs; [
      arandr
      chromium
      electrum
      ffmpeg-full
      firefox
      imagemagick
      inkscape
      kate
      keybase-gui
      # kmail - not using it anyway :(
      kolourpaint
      nixfmt
      okular
      paprefs
      pavucontrol
      signal-desktop
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
      mastodon-update-script
      # aseprite-unfree

      pynitrokey

      #      cadquery-server
      #
      #    #  (pkgs.python-for-cadquery.withPackages (pp: with pp; [
      #    #    ipython
      #    #    cadquery
      #    #    cq-kit
      #    #    cadquery-massembly
      #    #    cad-viewer-widget
      #    #    voila
      #    #  ]))

      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions;
          [
            bbenoist.nix
            ms-python.python
            # 4ops.terraform
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
          ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "cadquery";
              publisher = "roipoussiere";
              version = "0.1.3";
              sha256 = "sha256-Tn59uZHV1bU6NvlQpqTptAHhJKyEkj5ER0Ba2R6wf1U=";
            }
            {
              name = "cpptools-extension-pack";
              publisher = "ms-vscode";
              version = "1.3.0";
              sha256 = "sha256-rHST7CYCVins3fqXC+FYiS5Xgcjmi7QW7M4yFrUR04U=";
            }
            {
              name = "vscode-3d-preview";
              publisher = "tatsy";
              version = "0.2.1";
              sha256 = "sha256-Hq2eUr5cs2tEC/kdommpczDrBO9akcLd1AKLotNw8kc=";
            }
          ];
      })

      prusa-slicer
      #      (prusa-slicer.overrideAttrs (old: {
      #        patches = old.patches or [] ++ [
      #	  ../pkgs/prusa-slicer-basicauth.patch
      #	];
      #      }))
    ];

    zramSwap.enable = true;
    boot.kernel.sysctl = { "vm.swappiness" = 160; };

    nixpkgs.config.joypixels.acceptLicense = true;
    nixpkgs.config.firefox = {
      enablePlasmaBrowserIntegration = true;
      enableBrowserpass = true;
    };

    users.users.ar = {
      hashedPassword = lib.mkForce
        config.my.secrets.userDB.ar.passwords.${config.networking.hostName};
    };

    my.interactive.enable = lib.mkDefault true;
  };
}
