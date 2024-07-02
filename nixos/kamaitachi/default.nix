{ config, pkgs, lib, inputs, ... }:

let
  ci-secrets = import ../../ci-secrets.nix;
  klipperScreenConfig = builtins.toFile "KlipperConfig.conf" ''
    [printer Kodak]
    moonraker_host: localhost
    moonraker_port: 7125
  '';
  cageScript = pkgs.writeScriptBin "klipperCageScript" ''
    #!${pkgs.runtimeShell}
    ${pkgs.wlr-randr}/bin/wlr-randr --output HDMI-A-1 --transform 180
    sounds=( /home/ar/startup-sounds/* )
    ${pkgs.mpv}/bin/mpv ''${sounds[ $RANDOM % ''${#sounds[@]}]} &
    ${pkgs.klipperscreen}/bin/KlipperScreen --configfile ${klipperScreenConfig}
  '';
  klipperHostMcu = "${
      pkgs.klipper-firmware.override {
        firmwareConfig = ./klipper-rpi.cfg;
        klipper = klipperOld;
      }
    }/klipper.elf";
  klipperOld = pkgs.klipper.overrideAttrs (old: {
    version = "unstable-dc6182f3";

    src = pkgs.fetchFromGitHub {
      owner = "KevinOConnor";
      repo = "klipper";
      rev =
        "dc6182f3b339b990c8a68940f02a210e332be269"; # 266e96621c0133e1192bbaec5addb6bcf443a203 broke shit in weird ways
      sha256 = "sha256-0uoq5bvL/4L9oa/JY54qHMRw5vE7V//HxLFMOEqGUjA=";
    };
  });
in {
  # https://en.wikipedia.org/wiki/Kamaitachi
  networking.hostName = "kamaitachi";
  deployment.buildOnTarget = lib.mkForce false;
  deployment.tags = [ "reachable-home" ];

  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image.nix"
    inputs.self.nixosModules.common
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

        [pi4]
        kernel=u-boot-rpi4.bin
        enable_gic=1
        armstub=armstub8-gic.bin

        # Otherwise the resolution will be weird in most cases, compared to
        # what the pi3 firmware does by default.
        disable_overscan=1

        # Supported in newer board revisions
        arm_boost=1

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
    # avoid building zfs
    supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];
    kernelParams = [ "console=ttyS1,115200n8" "fbcon=rotate:2" ];
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };

  environment.etc."wifi-secrets".text = ci-secrets.wifi;

  systemd.network.enable = lib.mkForce false;
  networking = {
    useDHCP = true;
    wireless = {
      enable = true;
      environmentFile = "/etc/wifi-secrets";
      networks."hackerspace.pl-guests".psk = "@HSWAW_WIFI@";
      networks."hackerspace.pl-guests-5G".psk = "@HSWAW_WIFI@";
      networks."Nibylandia-5G".psk = "@NIBYLANDIA_WIFI@";
      networks."Nibylandia".psk = "@NIBYLANDIA_WIFI@";
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

  users.users.root.hashedPassword =
    "$y$j9T$.1ogQkT5J95hEFkgp9esc0$rneVdOpPwPDsgAckJsXJmzgVEENPkFWHWKgca2mVz6D";
  users.mutableUsers = false;
  users.users.ar = {
    extraGroups = [ "video" "dialout" "plugdev" "pipewire" ];
  };

  documentation = {
    enable = lib.mkForce false;
  } // builtins.listToAttrs (map (x: {
    name = x;
    value = { enable = lib.mkForce false; };
  }) [ "man" "info" "nixos" "doc" "dev" ]);

  services.openssh.settings.PasswordAuthentication = lib.mkForce true;
  services.openssh.settings.PermitRootLogin = lib.mkForce "yes";

  hardware.graphics.enable = true;

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
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };
  services.udisks2 = { enable = true; };

  # diet
  boot.binfmt.emulatedSystems = lib.mkForce [ ];
  environment.systemPackages = with pkgs; [
    # strictly required
    coreutils
    nix
    systemd

    # shell's required and not automatically pulled in
    zsh
    bashInteractive

    # avoid warnings
    gnugrep
    (glibcLocales.override {
      allLocales = false;
      locales = [ "en_US.UTF-8/UTF-8" "en_CA.UTF-8/UTF-8" "en_DK.UTF-8/UTF-8" ];
    })

    # nice-to-haves
    procps
    openssh
    findutils
    iproute2
    util-linux
    usbutils
    neovim
    tmux
    uhubctl

    # strictly unnecessary
    mpv
    alsa-utils
    bluez
    pipewire
    (v4l-utils.override { withGUI = false; })
  ];
  programs.nix-index.enable = lib.mkForce false;
  services.journald.extraConfig = ''
    Storage=volatile
  '';
  systemd.coredump.enable = false;
  services.lvm.enable = lib.mkForce false;

  # strictly plotter stuff below

  systemd.services.klipper-mcu-rpi = {
    description = "Klipper 3D host mcu";
    wantedBy = [ "multi-user.target" ];
    before = [ "klipper.service" ];
    serviceConfig = {
      DynamicUser = true;
      User = "klipper";
      RuntimeDirectory = "klipper-mcu";
      StateDirectory = "klipper";
      SupplementaryGroups = [ "dialout" "pipewire" ];
      OOMScoreAdjust = "-999";
      CPUSchedulingPolicy = "rr";
      CPUSchedulingPriority = 99;
      IOSchedulingClass = "realtime";
      IOSchedulingPriority = 0;
      ExecStart = "${klipperHostMcu} -I /run/klipper-mcu/mcu-rpi";
      ReadWritePaths = "/dev/gpiochip0";
    };
  };
  systemd.services.klipper.serviceConfig = {
    SupplementaryGroups = [ "dialout" "pipewire" ];
    ReadWritePaths = "/var/lib/moonraker/config";
  };
  services.klipper = {
    enable = true;
    mutableConfig = false;
    firmwares = {
      mcu = {
        enableKlipperFlash = false;
        enable = true;
        configFile = ./klipper-skr-pico.cfg;
        serial = "/dev/ttyAMA0";
        package = pkgs.klipper-firmware.override {
          gcc-arm-embedded = pkgs.gcc-arm-embedded-11;
          klipper = klipperOld;
        };
      };
    };
    settings = {
      printer = {
        kinematics = "corexy";
        max_accel = "1000";
        max_velocity = "100";
        max_z_accel = "30";
        max_z_velocity = "5";
      };
      mcu = { serial = "/dev/ttyAMA0"; };
      "mcu rpi" = { serial = "/run/klipper-mcu/mcu-rpi"; };
      virtual_sdcard = { path = "/var/lib/moonraker/gcodes"; };

      pause_resume = { };
      display_status = { };
      exclude_object = { };
      force_move = { enable_force_move = "true"; };

      save_variables = {
        filename = "/var/lib/moonraker/config/variables.cfg";
      };

      "temperature_sensor rpi" = { sensor_type = "temperature_host"; };

      "stepper_x" = {
        step_pin = "gpio11";
        dir_pin = "!gpio10";
        enable_pin = "!gpio12";
        microsteps = "16";
        rotation_distance = "40";
        endstop_pin = "^gpio4";
        position_endstop = "0";
        position_max = "235";
        homing_speed = "50";
      };
      "tmc2209 stepper_x" = {
        uart_pin = "gpio9";
        tx_pin = "gpio8";
        uart_address = "0";
        run_current = "0.580";
        stealthchop_threshold = "999999";
      };
      "stepper_y" = {
        step_pin = "gpio6";
        dir_pin = "!gpio5";
        enable_pin = "!gpio7";
        microsteps = "16";
        rotation_distance = "40";
        endstop_pin = "^gpio3";
        position_endstop = "0";
        position_max = "235";
        homing_speed = "50";
      };
      "tmc2209 stepper_y" = {
        uart_pin = "gpio9";
        tx_pin = "gpio8";
        uart_address = "2";
        run_current = "0.580";
        stealthchop_threshold = "999999";
      };
      "stepper_z" = {
        step_pin = "gpio19";
        dir_pin = "gpio28";
        enable_pin = "!gpio2";
        microsteps = "16";
        rotation_distance = "8";
        endstop_pin = "^gpio25";
        position_endstop = "0.0";
        position_max = "250";
      };
      "tmc2209 stepper_z" = {
        uart_pin = "gpio9";
        tx_pin = "gpio8";
        uart_address = "1";
        run_current = "0.580";
        stealthchop_threshold = "999999";
      };
      "neopixel board_neopixel" = {
        pin = "gpio24";
        chain_count = "1";
        color_order = "GRB";
        initial_RED = "0.3";
        initial_GREEN = "0.3";
        initial_BLUE = "0.3";
      };
      "delayed_gcode t0_offset" = {
        gcode = [ "SET_GCODE_OFFSET X=0 Y=0 Z=0" ];
        initial_duration = ".02";
      };
    } // lib.mapAttrs' (name: value:
      lib.nameValuePair
      ("gcode_macro " + (builtins.replaceStrings [ ".gcode" ] [ "" ] name)) {
        gcode = lib.remove "" (lib.splitString "\n"
          (builtins.readFile (./klipper-macros/. + "/${name}")));
      }) (lib.attrsets.filterAttrs (n: v: n != ".gitkeep")
        (builtins.readDir ./klipper-macros/.));
  };

  services.moonraker = {
    user = "root";
    enable = true;
    address = "0.0.0.0";
    allowSystemControl = true;
    settings = {
      octoprint_compat = { };
      history = { };
      authorization = {
        force_logins = false;
        cors_domains = [
          "*.local"
          "*.waw.hackerspace.pl"
          "*.nibylandia.lan"
          "*.tail412c1.ts.net"
        ];
        trusted_clients = [
          "127.0.0.1/32"
          "10.8.0.0/23"
          "100.64.0.0/10"
          "2a0d:eb00:4242:0000:0000:0000:0000:0000/64"
          "192.168.24.0/24"
          "192.168.20.0/24"
        ];
      };
      # causes issues for some reason
      # zeroconf = { mdns_hostname = "barbie-girl"; };
      machine = { provider = "systemd_cli"; };
      "webcam rpi" = {
        enabled = "True";
        service = "mjpegstreamer-adaptive";
        stream_url = "/webcam/stream";
        snapshot_url = "/webcam/snapshot";
        target_fps = "30";
        target_fps_idle = "30";
        aspect_ratio = "4:3";
      };
    };
  };

  services.fluidd = {
    enable = false;
    nginx.locations."/webcam/".proxyPass = "http://127.0.0.1:8080/";
  };

  services.mainsail = {
    enable = true;
    nginx.locations."/webcam/".proxyPass = "http://127.0.0.1:8080/";
  };

  services.nginx.clientMaxBodySize = "1000m";
  services.nginx.recommendedProxySettings = true;

  systemd.services.ustreamer = {
    wantedBy = [ "multi-user.target" ];
    description = "uStreamer for video0";
    serviceConfig = {
      Type = "simple";
      ExecStart =
        "${pkgs.ustreamer}/bin/ustreamer --encoder=HW --persistent --rotate 90 --slowdown --resolution 1296x972 --desired-fps 30";
    };
  };

  services.cage = {
    enable = true;
    user = "ar";
    program = "${cageScript}/bin/klipperCageScript";
    environment = {
      GDK_BACKEND = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
    extraArguments = [ "-d" ];
  };
  systemd.services."cage-tty1".serviceConfig.Restart = "always";
}
