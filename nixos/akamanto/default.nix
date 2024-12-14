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
    ${pkgs.wlr-randr}/bin/wlr-randr --output Unknown-1 --transform 180
    sounds=( /home/ar/startup-sounds/* )
    ${pkgs.mpv}/bin/mpv ''${sounds[ $RANDOM % ''${#sounds[@]}]} &
    ${pkgs.klipperscreen}/bin/KlipperScreen --configfile ${klipperScreenConfig}
  '';
  klipperHostMcu = "${
      pkgs.klipper-firmware.override {
        firmwareConfig = ./klipper-rpi.cfg;
      }
    }/klipper.elf";
in {
  # https://en.wikipedia.org/wiki/Aka_Manto
  networking.hostName = "akamanto";
  deployment.buildOnTarget = lib.mkForce false;

  imports = [ "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image.nix" ]
    ++ (with inputs.self.nixosModules; [ common ]);

  nixpkgs.overlays = [ inputs.self.overlays.rpi5 ];

  sdImage = {
    compressImage = false;
    firmwareSize = 1024;
    imageName =
      "${config.sdImage.imageBaseName}-${pkgs.stdenv.hostPlatform.system}-${config.networking.hostName}.img";
    populateFirmwareCommands = ''
      storePath() {
        local path="$1"
        echo ''${path/\/nix\/store\/}
      }

      cp -v ${pkgs.rpi5-uefi}/* firmware
      cp -v ${pkgs.rpi5-dtb}/* firmware

      mkdir -p firmware/kernels
      touch firmware/nixos-sd-system-image

      kernelFile=$(storePath ${config.boot.kernelPackages.kernel})-${config.system.boot.loader.kernelFile}
      initrdFile=$(storePath ${config.system.build.initialRamdisk})-${config.system.boot.loader.initrdFile}

      cp ${
        config.boot.kernelPackages.kernel + "/"
        + config.system.boot.loader.kernelFile
      } \
        firmware/kernels/$kernelFile

      cp ${
        config.system.build.initialRamdisk + "/"
        + config.system.boot.loader.initrdFile
      } \
        firmware/kernels/$initrdFile

      mkdir -p firmware/EFI/boot

      # making our own efi program; grub-install tries to probe for things
      MODULES=( fat part_gpt part_msdos normal boot linux configfile efifwsetup
        ls search search_label search_fs_uuid search_fs_file echo serial test
        loadenv ext2 reboot help cat )
      ${pkgs.grub2_efi}/bin/grub-mkimage --directory=${pkgs.grub2_efi}/lib/grub/arm64-efi \
        -o firmware/EFI/boot/bootaa64.efi \
        -p /EFI/boot -O arm64-efi ''${MODULES[@]}

      cat <<EOF > firmware/EFI/boot/grub.cfg
      search --set=drive1 --file /nixos-sd-system-image

      set timeout=10
      set default="0"

      menuentry '${config.system.nixos.distroName} ${config.system.nixos.label}' {
        linux (\$drive1)/kernels/$kernelFile init=${config.system.build.toplevel}/init ${
          toString config.boot.kernelParams
        }
        initrd (\$drive1)/kernels/$initrdFile
      }
      EOF
    '';
    populateRootCommands = ''
      mkdir -p ./files/boot
    '';
  };

  hardware.enableRedistributableFirmware = lib.mkForce false;
  hardware.firmware = with pkgs; [ raspberrypiWirelessFirmware wireless-regdb ];

  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_rpi5;
    supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];
    kernelParams = [
      "fbcon=rotate:2"
      "8250.nr_uarts=11"
      "console=ttyAMA10,115200"
      "console=tty0"
    ];
    initrd.availableKernelModules = lib.mkForce [
      "usbhid"
      "usb_storage"
      "vc4"
      "pcie_brcmstb" # required for the pcie bus to work
      "reset-raspberrypi" # required for vl805 firmware to load
    ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
  };

  fileSystems = lib.mkForce {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      options = [ "x-initrd.mount" ];
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
    };
  };

  environment.etc."wifi-secrets".text = ci-secrets.wifi;

  systemd.network.enable = lib.mkForce false;
  networking = {
    useDHCP = true;
    wireless = {
      enable = true;
      secretsFile = "/etc/wifi-secrets";
      networks."hackerspace.pl-guests".pskRaw = "ext:HSWAW_WIFI";
      networks."hackerspace.pl-guests-5G".pskRaw = "ext:HSWAW_WIFI";
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
  environment.systemPackages = [
    # avoid warnings
    (pkgs.glibcLocales.override {
      allLocales = false;
      locales = [ "en_US.UTF-8/UTF-8" "en_CA.UTF-8/UTF-8" "en_DK.UTF-8/UTF-8" ];
    })

    # strictly unnecessary
    (pkgs.v4l-utils.override { withGUI = false; })
  ] ++ (with pkgs;
  # lib.mkForce
    [
      # strictly required
      coreutils
      nix
      systemd

      # shell's required and not automatically pulled in
      zsh
      bashInteractive

      # avoid warnings
      gnugrep

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
      libraspberrypi
      raspberrypi-eeprom

      # strictly unnecessary
      mpv
      alsa-utils
      bluez
      pipewire
    ]);
  programs.nix-index.enable = lib.mkForce false;
  services.journald.extraConfig = ''
    Storage=volatile
  '';
  systemd.coredump.enable = false;
  services.lvm.enable = lib.mkForce false;
  # strictly printer stuff below

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
    mutableConfig = true;
    mutableConfigFolder = "/var/lib/moonraker/config";
    firmwares = {
      mcu = {
        enableKlipperFlash = false;
        enable = true;
        configFile = ./klipper-octopus.cfg;
        serial =
          "/dev/serial/by-id/usb-Klipper_stm32f429xx_400048000251313133383438-if00";
        package = pkgs.klipper-firmware.override {
          gcc-arm-embedded = pkgs.gcc-arm-embedded-11;
        };
      };
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
      mcu = {
        serial =
          "/dev/serial/by-id/usb-Klipper_stm32f429xx_400048000251313133383438-if00";
      };
      "mcu rpi" = { serial = "/run/klipper-mcu/mcu-rpi"; };
      virtual_sdcard = { path = "/var/lib/moonraker/gcodes"; };

      pause_resume = { };
      display_status = { };
      exclude_object = { };
      force_move = { enable_force_move = "true"; };

      idle_timeout = {
        timeout = 1800;
        gcode = [ "TURN_OFF_HEATERS" ];
      };

      save_variables = {
        filename = "/var/lib/moonraker/config/variables.cfg";
      };

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
      safe_z_home = { home_xy_position = "110, 110"; };

      "temperature_sensor ambient" = {
        sensor_pin = "P0.26";
        sensor_type = "ATC Semitec 104GT-2";
      };

      "temperature_sensor rpi" = { sensor_type = "temperature_host"; };

      fan = { pin = "P2.4"; };
      "fan_generic exhaust" = { pin = "P2.6"; };

      firmware_retraction = {
        retract_length = "5.5";
        retract_speed = "45";
      };

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
        max_extrude_cross_section = "2.56";
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
        max_extrude_cross_section = "2.56";
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

      "led caselight" = {
        red_pin = "rpi:gpio17";
        green_pin = "rpi:gpio27";
        blue_pin = "rpi:gpio22";
        hardware_pwm = false;
        cycle_time = "0.005";

        initial_RED = "1.0";
        initial_GREEN = "0.0";
        initial_BLUE = "0.455";
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
        gcode = [ "SET_GCODE_OFFSET X=0 Y=0 Z=-0.0" ];
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
        cors_domains = [ "*.local" "*.waw.hackerspace.pl" ];
        trusted_clients = [
          "127.0.0.1/32"
          "10.8.0.0/23"
          "100.64.0.0/10"
          "2a0d:eb00:4242:0000:0000:0000:0000:0000/64"
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
        "${pkgs.ustreamer}/bin/ustreamer --encoder=HW --persistent --rotate 180 --resolution 1296x972 --desired-fps 30";
    };
  };

  # the proper way to do this, supposedly, would be to tie the touchscreen input to display output, eg. with:
  # ENV{WL_OUTPUT}="HDMI-A-1"
  # sadly, this doesn't work for us here, for some unbeknownst reason
  services.udev.extraRules = ''
    KERNEL=="gpiochip0", GROUP="dialout", MODE="0660"
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
