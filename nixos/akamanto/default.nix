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
    ${pkgs.klipperscreen}/bin/KlipperScreen --configfile ${klipperScreenConfig}
  '';
  klipperHostMcu = "${pkgs.klipper-firmware.override {
    firmwareConfig = ./klipper-rpi.cfg;
  }}/klipper.elf";
in {
  # https://en.wikipedia.org/wiki/Aka_Manto
  networking.hostName = "akamanto";
  deployment.targetHost = "akamanto.local";
  deployment.buildOnTarget = lib.mkForce false;

  imports = with inputs.self.nixosModules; [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image.nix"
    common
    # inputs.impermanence.nixosModule
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
    '';
    populateRootCommands = ''
      mkdir -p ./files/boot
      ${config.boot.loader.generic-extlinux-compatible.populateCmd} -c ${config.system.build.toplevel} -d ./files/boot
    '';
  };

  hardware.enableRedistributableFirmware = lib.mkForce false;
  hardware.firmware = with pkgs; [ raspberrypiWirelessFirmware wireless-regdb ];
  boot = {
    # revisit https://github.com/NixOS/nixpkgs/issues/154163 if actually needed
    # kernelPackages = pkgs.linuxPackages_rpi3;
    # camera, kernel side
    kernelModules = [ "bcm2835-v4l2" ];
    # avoid building zfs
    supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];
    kernelParams = [ "console=ttyS1,115200n8" "fbcon=rotate:2" ];
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
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.firewall.allowedUDPPorts = [ 80 443 ];

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
  users.users.ar = { extraGroups = [ "video" "dialout" "plugdev" ]; };

  documentation = {
    enable = lib.mkForce false;
  } // builtins.listToAttrs (map (x: {
    name = x;
    value = { enable = lib.mkForce false; };
  }) [ "man" "info" "nixos" "doc" "dev" ]);

  services.openssh.settings.PasswordAuthentication = lib.mkForce true;
  services.openssh.settings.PermitRootLogin = lib.mkForce "yes";

  hardware.opengl.enable = true;

  # diet
  boot.binfmt.emulatedSystems = lib.mkForce [ ];
  environment.systemPackages = with pkgs;
    lib.mkForce [
      coreutils
      zsh
      bashInteractive
      nix
      systemd
      gnugrep
      openssh
      (glibcLocales.override {
        allLocales = false;
        locales =
          [ "en_US.UTF-8/UTF-8" "en_CA.UTF-8/UTF-8" "en_DK.UTF-8/UTF-8" ];
      })
    ];
  programs.nix-index.enable = lib.mkForce false;
  services.journald.extraConfig = ''
    Storage=volatile
  '';
  systemd.coredump.enable = false;
  services.lvm.enable = lib.mkForce false;
  # strictly printer stuff below

  systemd.services.klipper-mcu-rpi = {
    serviceConfig = {
      DynamicUser = true;
      User = "klipper";
      RuntimeDirectory = "klipper";
      StateDirectory = "klipper";
      SupplementaryGroups = [ "dialout" ];
      OOMScoreAdjust = "-999";
      CPUSchedulingPolicy = "rr";
      CPUSchedulingPriority = 99;
      IOSchedulingClass = "realtime";
      IOSchedulingPriority = 0;
      ExecStart = "${klipperHostMcu} -r -I /run/klipper/mcu-rpi";
    };
    unitConfig = {
      Before = [ "klipper.service" ];
    };
  };
  ## uncomment if you need manual config changes
  #systemd.services.klipper.serviceConfig = {
  #  ExecStart = lib.mkForce [
  #    ""
  #    "${pkgs.klipper}/bin/klippy --input-tty=/run/klipper/tty --api-server=/run/klipper/api /var/lib/moonraker/config/klipper.cfg"
  #  ];
  #  ReadWritePaths = "/var/lib/moonraker/config/";
  #};
  services.klipper = {
    enable = true;
    mutableConfig = false;
    firmwares = {
      mcu = {
        enableKlipperFlash = false;
        enable = true;
        configFile = ./klipper-smoothie.cfg;
        serial = "/dev/ttyACM0";
        package = pkgs.klipper-firmware.override { };
      };
      # this will be handled differently anyway
      #rpi = {
      #  enable = true;
      #  configFile = ./klipper-rpi.cfg;
      #  serial = "/run/klipper/host-mcu";
      #  package = pkgs.klipper-firmware.overrideAttrs (old: {
      #    postPatch = (old.postPatch or "") + ''
      #      substituteInPlace ./Makefile \
      #        --replace '-Isrc' '-iquote src'
      #      substituteInPlace ./src/linux/gpio.c \
      #        --replace '/usr/include/linux/gpio.h' 'linux/gpio.h'
      #      substituteInPlace ./src/linux/main.c \
      #        --replace '/usr/include/sched.h' 'sched.h'
      #    '';
      #  });
      #};
    };
    # imported using:
    # sed -r -e 's/^([^:]*):/\1=/' -e 's/=(.{1,})$/="\1"/' -e '/^\[.*[ ]/s/\[(.*)\]/["\1"]/' klipper-printer.cfg > klipper-printer.toml
    # + some small fixes
    # + nix repl :p fromTOML (builtins.readFile ( ./. + "/klipper-printer.toml"))
    settings = {
      printer = {
        kinematics = "corexy";
        max_accel = "2000";
        max_velocity = "300";
        max_z_accel = "100";
        max_z_velocity = "5";
      };
      mcu = { serial = "/dev/ttyACM0"; };
      "mcu rpi" = { serial = "/run/klipper/mcu-rpi"; };
      virtual_sdcard = { path = "/var/lib/moonraker/gcodes"; };

      pause_resume = { };
      display_status = { };
      exclude_object = { };
      force_move = { enable_force_move = "true"; };

      bed_mesh = {
        horizontal_move_z = "5";
        mesh_max = "210, 200";
        mesh_min = "5, 5";
        probe_count = "5, 5";
        speed = "120";
      };

      "bed_mesh default" = {
        version = 1;
        x_count = 5;
        y_count = 5;
        mesh_x_pps = 2;
        mesh_y_pps = 2;
        algo = "lagrange";
        tension = 0.2;
        min_x = 5.0;
        max_x = 210.0;
        min_y = 5.0;
        max_y = 200.0;
        # klippy is, apparently, very specific about bed mesh formatting
        points = "\n" + lib.concatStringsSep "\n" (map (s: "  " + s)
          (map (l: lib.concatStringsSep ", " l) [
            [ "-0.747500" "-0.752500" "-0.776250" "-0.851250" "-0.990625" ]
            [ "-0.590000" "-0.582500" "-0.588750" "-0.688750" "-0.839375" ]
            [ "-0.376875" "-0.362500" "-0.388750" "-0.464375" "-0.623750" ]
            [ "-0.184375" "-0.220000" "-0.208750" "-0.221250" "-0.361875" ]
            [ "0.128125" "0.078750" "0.065000" "0.038750" "-0.075625" ]
          ]));
      };

      probe = {
        pin = "P1.25";
        z_offset = "-0.300";
      };
      "temperature_sensor ambient" = {
        sensor_pin = "P0.26";
        sensor_type = "ATC Semitec 104GT-2";
      };

      fan = { pin = "P2.4"; };
      "fan_generic exhaust" = { pin = "P2.6"; };

      heater_bed = {
        control = "watermark";
        heater_pin = "P2.5";
        max_temp = "130";
        min_temp = "0";
        sensor_pin = "P0.25";
        sensor_type = "Honeywell 100K 135-104LAG-J01";
      };

      extruder = {
        control = "pid";
        dir_pin = "!P0.5";
        enable_pin = "!P0.4";
        filament_diameter = "1.750";
        heater_pin = "P2.7";
        max_temp = "295";
        microsteps = "32";
        min_temp = "0";
        nozzle_diameter = "0.400";
        pid_Kd = "160";
        pid_Ki = "2.318";
        pid_Kp = "38.5";
        rotation_distance = "8.07";
        sensor_pin = "P0.23";
        sensor_type = "ATC Semitec 104GT-2";
        step_pin = "P2.0";
      };
      extruder1 = {
        control = "pid";
        dir_pin = "P0.11";
        enable_pin = "!P0.10";
        filament_diameter = "1.750";
        heater_pin = "P1.23";
        max_temp = "265";
        microsteps = "32";
        min_temp = "0";
        nozzle_diameter = "0.400";
        pid_Kd = "160";
        pid_Ki = "2.318";
        pid_Kp = "38.5";
        rotation_distance = "8.07";
        sensor_pin = "P0.24";
        sensor_type = "ATC Semitec 104GT-2";
        step_pin = "P2.1";
      };

      stepper_x = {
        dir_pin = "!P0.22";
        enable_pin = "!P0.21";
        endstop_pin = "^P1.24";
        homing_positive_dir = "true";
        homing_speed = "80";
        microsteps = "32";
        position_endstop = "220";
        position_max = "220";
        position_min = "-15";
        rotation_distance = "40";
        step_pin = "P2.3";
      };
      stepper_y = {
        dir_pin = "!P0.20";
        enable_pin = "!P0.19";
        endstop_pin = "^P1.26";
        homing_positive_dir = "true";
        homing_speed = "80";
        microsteps = "32";
        position_endstop = "215";
        position_max = "215";
        rotation_distance = "40";
        step_pin = "P2.2";
      };
      stepper_z = {
        dir_pin = "P2.13";
        enable_pin = "!P4.29";
        endstop_pin = "^P1.29";
        homing_positive_dir = "true";
        homing_speed = "50";
        microsteps = "32";
        position_endstop = "235";
        position_max = "240";
        position_min = "-5";
        rotation_distance = "4";
        step_pin = "P2.8";
      };

      "gcode_macro CANCEL_PRINT" = {
        description = "Cancel the actual running print";
        gcode = [ "TURN_OFF_HEATERS" "CANCEL_PRINT_BASE" ];
        rename_existing = "CANCEL_PRINT_BASE";
      };
      "delayed_gcode bed_mesh_init" = {
        gcode = [ "BED_MESH_PROFILE LOAD=default" ];
        initial_duration = ".01";
      };
      "delayed_gcode t0_offset" = {
        gcode = [ "SET_GCODE_OFFSET X=0 Y=0 Z=-0.1" ];
        initial_duration = ".02";
      };
    } // lib.mapAttrs' (name: value:
      lib.nameValuePair
      ("gcode_macro " + (builtins.replaceStrings [ ".gcode" ] [ "" ] name)) {
        gcode = lib.remove "" (lib.splitString "\n"
          (builtins.readFile (./klipper-macros/. + "/${name}")));
      }) (builtins.readDir ./klipper-macros/.);
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
        cors_domains = [ "*.local" "*.waw.hackerspace.pl" ];
        trusted_clients = [ "127.0.0.1/32" "10.8.0.0/23" ];
      };
      machine = { provider = "systemd_cli"; };
    };
    package = pkgs.moonraker.overrideAttrs (old: {
      patches = (old.patches or [ ])
        ++ [ ./moonraker-remove-config-path-warning.patch ];
    });
  };

  services.fluidd = {
    enable = true;
    nginx.locations."/webcam".proxyPass = "http://127.0.0.1:8080/stream";
  };

  services.nginx.clientMaxBodySize = "1000m";

  systemd.services.ustreamer = {
    wantedBy = [ "multi-user.target" ];
    description = "uStreamer for video0";
    serviceConfig = {
      Type = "simple";
      ExecStart =
        "${pkgs.ustreamer}/bin/ustreamer --encoder=HW --persistent --drop-same-frames=30";
    };
  };

  # the proper way to do this, supposedly, would be to tie the touchscreen input to display output, eg. with:
  # ENV{WL_OUTPUT}="HDMI-A-1"
  # sadly, this doesn't work for us here, for some unbeknownst reason
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="0eef", ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"
  '';
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
