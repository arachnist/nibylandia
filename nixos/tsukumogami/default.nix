{ config, pkgs, lib, inputs, ... }:

let
  ci-secrets = import ../../ci-secrets.nix;
  cageScript = pkgs.writeScriptBin "inventoryChromium" ''
    #!${pkgs.runtimeShell}
    ${pkgs.wlr-randr}/bin/wlr-randr --output HDMI-A-1 --transform 90
    ${pkgs.chromium}/bin/chromium --kiosk https://inventory.hackerspace.pl
  '';
in {
  # https://en.wikipedia.org/wiki/Tsukumogami
  networking.hostName = "tsukumogami";
  deployment.buildOnTarget = lib.mkForce false;
  deployment.tags = [ "reachable-hs" ];

  imports = with inputs.self.nixosModules; [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image.nix"
    common
  ];

  # don't want to pull in all of installer stuff, so we need to copy some things from sd-image-aarch64.nix:
  sdImage = {
    compressImage = false;
    imageName =
      "${config.sdImage.imageBaseName}-${pkgs.stdenv.hostPlatform.system}-${config.networking.hostName}.img";
    populateFirmwareCommands = let
      configTxt = pkgs.writeText "config.txt" ''
        [pi3]
        kernel=u-boot-rpi3.bin

        [pi02]
        kernel=u-boot-rpi3.bin

        [pi4]
        kernel=u-boot-rpi4.bin
        enable_gic=1
        armstub=armstub8-gic.bin

        # Otherwise the resolution will be weird in most cases, compared to
        # what the pi3 firmware does by default.
        disable_overscan=1

        # Supported in newer board revisions
        arm_boost=1

        [cm4]
        # Enable host mode on the 2711 built-in XHCI USB controller.
        # This line should be removed if the legacy DWC2 controller is required
        # (e.g. for USB device mode) or if USB support is not required.
        otg_mode=1

        [all]
        # Boot in 64-bit mode.
        arm_64bit=1

        # U-Boot needs this to work, regardless of whether UART is actually used or not.
        # Look in arch/arm/mach-bcm283x/Kconfig in the U-Boot tree to see if this is still
        # a requirement in the future.
        enable_uart=1

        # Prevent the firmware from smashing the framebuffer setup done by the mainline kernel
        # when attempting to show low-voltage or overtemperature warnings.
        avoid_warnings=1
      '';
    in ''
      (cd ${pkgs.raspberrypifw}/share/raspberrypi/boot && cp bootcode.bin fixup*.dat start*.elf $NIX_BUILD_TOP/firmware/)

      # Add the config
      cp ${configTxt} firmware/config.txt

      # Add pi3 specific files
      cp ${pkgs.ubootRaspberryPi3_64bit}/u-boot.bin firmware/u-boot-rpi3.bin

      # Add pi4 specific files
      cp ${pkgs.ubootRaspberryPi4_64bit}/u-boot.bin firmware/u-boot-rpi4.bin
      cp ${pkgs.raspberrypi-armstubs}/armstub8-gic.bin firmware/armstub8-gic.bin
      cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-4-b.dtb firmware/
      cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-400.dtb firmware/
      cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-cm4.dtb firmware/
      cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-cm4s.dtb firmware/
    '';
    populateRootCommands = ''
      mkdir -p ./files/boot
      ${config.boot.loader.generic-extlinux-compatible.populateCmd} -c ${config.system.build.toplevel} -d ./files/boot
    '';
  };

  hardware.enableRedistributableFirmware = lib.mkForce false;
  hardware.firmware = with pkgs; [ raspberrypiWirelessFirmware wireless-regdb ];
  boot = {
    # camera, kernel side
    # kernelModules = [ "bcm2835-v4l2" ];
    # avoid building zfs
    supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];
    kernelParams = [ "console=ttyS1,115200n8" "fbcon=rotate:1" ];
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  environment.etc."wifi-secrets".text = ci-secrets.wifi;

  microvm.host.enable = false;

  systemd.network.enable = lib.mkForce false;
  networking = {
    useDHCP = true;
    wireless = {
      enable = true;
      environmentFile = "/etc/wifi-secrets";
      networks."hackerspace.pl-guests".psk = "@HSWAW_WIFI@";
      networks."hackerspace.pl-guests-5G".psk = "@HSWAW_WIFI@";
    };
  };
  networking.firewall.enable = false;

  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };

  # dupa.8
  users.users.root.hashedPassword =
    "$y$j9T$yzZnq2/mg6OawoGAbzb0f0$yOyJmpjmFWfm7GF7eRriCO5wwjCWaJWZOH.6f9gVZ3/";
  users.mutableUsers = false;
  users.users.inventory = {
    group = "inventory";
    extraGroups = [ "video" "dialout" "plugdev" "pipewire" ];
    isNormalUser = true;
  };
  users.groups.inventory = {};

  documentation = {
    enable = lib.mkForce false;
  } // builtins.listToAttrs (map (x: {
    name = x;
    value = { enable = lib.mkForce false; };
  }) [ "man" "info" "nixos" "doc" "dev" ]);

  services.openssh.settings.PasswordAuthentication = lib.mkForce true;
  services.openssh.settings.PermitRootLogin = lib.mkForce "yes";

  hardware.opengl.enable = true;

  # strictly for shits and giggles
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    systemWide = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.udisks2 = { enable = true; };

  # diet
  boot.binfmt.emulatedSystems = lib.mkForce [ ];
  environment.systemPackages = with pkgs;
    lib.mkForce [
      # strictly required
      coreutils
      nix
      systemd

      # shell's required and not automatically pulled in
      zsh
      bashInteractive

      # reaaaaally useful (on-screen keyboard)
      maliit-keyboard
      maliit-framework

      # avoid warnings
      gnugrep
      (glibcLocales.override {
        allLocales = false;
        locales = [
          "en_US.UTF-8/UTF-8"
          "en_CA.UTF-8/UTF-8"
          "en_DK.UTF-8/UTF-8"
          "pl_PL.UTF-8/UTF-8"
        ];
      })

      # nice-to-haves
      procps
      openssh
      findutils
      iproute2
      util-linux
      usbutils

      # strictly unnecessary
      mpv
      alsa-utils
      pipewire
      (v4l-utils.override { withGUI = false; })
    ];
  programs.nix-index.enable = lib.mkForce false;
  services.journald.extraConfig = ''
    Storage=volatile
  '';
  systemd.coredump.enable = false;
  services.lvm.enable = lib.mkForce false;

  # systemd.services.ustreamer = {
  #   wantedBy = [ "multi-user.target" ];
  #   description = "uStreamer for video0";
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart =
  #       "${pkgs.ustreamer}/bin/ustreamer --encoder=HW --persistent --rotate 90 --slowdown --resolution 1296x972 --desired-fps 30";
  #   };
  # };

  # the proper way to do this, supposedly, would be to tie the touchscreen input to display output, eg. with:
  # ENV{WL_OUTPUT}="HDMI-A-1"
  # sadly, this doesn't work for us here, for some unbeknownst reason
  # ENV{LIBINPUT_CALIBRATION_MATRIX}=“1 0 0 0 1 0” # default
  # ENV{LIBINPUT_CALIBRATION_MATRIX}=“0 -1 1 1 0 0” # 90 degree clockwise
  # ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1" # 180 degree clockwise
  # ENV{LIBINPUT_CALIBRATION_MATRIX}=“0 1 0 -1 0 1” # 270 degree clockwise
  # ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 1 0 0" # reflect along y axis
  # ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 1 0" # reflect along xgi axis
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="0408", ENV{LIBINPUT_CALIBRATION_MATRIX}=“0 -1 1 1 0 0”
  '';
  services.cage = {
    enable = true;
    user = "inventory";
    program = "${cageScript}/bin/inventoryChromium";
    environment = {
      GDK_BACKEND = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
    extraArguments = [ "-d" ];
  };
  systemd.services."cage-tty1".serviceConfig.Restart = "always";
}
