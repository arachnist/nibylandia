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
in {
  # https://en.wikipedia.org/wiki/Aka_Manto
  networking.hostName = "akamanto";
  deployment.targetHost = "akamanto.local";

  imports = with inputs.self.nixosModules; [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    common
    # inputs.impermanence.nixosModule
  ];
  sdImage.compressImage = false;
  hardware.enableRedistributableFirmware = true;
  boot = {
    # revisit https://github.com/NixOS/nixpkgs/issues/154163 if actually needed
    # kernelPackages = pkgs.linuxPackages_rpi3;
    # camera, kernel side
    kernelModules = [ "bcm2835-v4l2" ];
    # avoid building zfs
    supportedFilesystems = lib.mkForce [ "vfat" "ext4" ];
    kernelParams = [ "console=ttyS1,115200n8" "fbcon=rotate:2" ];
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
    };
  };

  time.timeZone = "Europe/Warsaw";
  users.users.ar.openssh.authorizedKeys.keys =
    config.users.users.root.openssh.authorizedKeys.keys;
  users.users.ar.extraGroups = [ "video" "dialout" "plugdev" ];
  users.users.root.hashedPassword =
    "$y$j9T$MO1vp6hFuWqWDJCxyzR.E0$7jJDzeL.fMg64tzmW76HjBy49LC4rtTBHH3/ivGOGc.";
  users.mutableUsers = false;

  #environment.persistence."/persistent" = {
  #  hideMounts = true;
  #  directories = [
  #    "/var/log"
  #    "/var/lib/bluetooth"
  #    "/var/lib/nixos"
  #  ];
  #  files = [
  #    "/etc/machine-id"
  #    { file = "/etc/ssh/ssh_host_ed25519_key"; parentDirectory = { mode = "0755"; }; }
  #    { file = "/etc/ssh/ssh_host_ed25519_key.pub"; parentDirectory = { mode = "0755"; }; }
  #    { file = "/etc/ssh/ssh_host_rsa_key"; parentDirectory = { mode = "0755"; }; }
  #    { file = "/etc/ssh/ssh_host_rsa_key.pub"; parentDirectory = { mode = "0755"; }; }
  #  ];
  #};

  environment.systemPackages = with pkgs; [
    minicom
    alsa-utils
    wlr-randr
    libinput
  ];

  hardware.opengl.enable = true;
  # strictly printer stuff below
  # temporary until configs are finalized
  systemd.services.klipper.serviceConfig = {
    ExecStart = lib.mkForce [
      ""
      "${pkgs.klipper}/bin/klippy --input-tty=/run/klipper/tty --api-server=/run/klipper/api /var/lib/moonraker/config/klipper.cfg"
    ];
    ReadWritePaths = "/var/lib/moonraker/config/";
  };
  services.klipper = {
    enable = true;
    mutableConfig = false;
    firmwares = {
      mcu = {
        enableKlipperFlash = true;
        enable = true;
        configFile = ./klipper-smoothie.cfg;
        serial = "/dev/ttyACM0";
        package = pkgs.klipper-firmware.override {
          gcc-arm-embedded = pkgs.gcc-arm-embedded-11;
        };
      };
    };
    # lies; not actually in use for now
    settings = {
      mcu.serial = "/dev/ttyACM0";
      pause_resume = { };
      display_status = { };
      virtual_sdcard = { path = "/var/lib/moonraker/gcodes"; };
      force_move = { enable_force_move = true; };
      printer = {
        kinematics = "corexy";
        max_velocity = 300;
        max_accel = 2000;
        max_z_velocity = 5;
        max_z_accel = 100;
      };

      fan = { pin = "P2.4"; };

      "fan_generic exhaust" = { pin = "P2.6"; };

      probe = {
        pin = "P1.25";
        z_offset = "3.36";
      };

      stepper_x = {
        step_pin = "P2.3";
        dir_pin = "!P0.22";
        enable_pin = "!P0.21";
        microsteps = "32";
        rotation_distance = "40";
        endstop_pin = "^P1.24";
        position_endstop = "220";
        position_min = "-15";
        position_max = "220";
        homing_speed = "80";
        homing_positive_dir = true;
      };
      stepper_y = {
        step_pin = "P2.2";
        dir_pin = "!P0.20";
        enable_pin = "!P0.19";
        microsteps = "32";
        rotation_distance = "40";
        endstop_pin = "^P1.26";
        position_endstop = "215";
        position_max = "215";
        homing_speed = "80";
        homing_positive_dir = true;
      };
      stepper_z = {
        step_pin = "P2.8";
        dir_pin = "P2.13";
        enable_pin = "!P4.29";
        microsteps = "32";
        rotation_distance = "4";
        endstop_pin = "^P1.29";
        position_endstop = "235";
        position_min = "-5";
        position_max = "240";
        homing_speed = "50";
        homing_positive_dir = true;
      };

      extruder = {
        step_pin = "P2.0";
        dir_pin = "P0.5";
        enable_pin = "!P0.4";
        microsteps = "32";
        rotation_distance = "8.07";
        nozzle_diameter = "0.400";
        filament_diameter = "1.750";
        heater_pin = "P2.7";
        sensor_type = "ATC Semitec 104GT-2";
        sensor_pin = "P0.23";
        control = "pid";
        pid_Kp = "38.5";
        pid_Ki = "2.318";
        pid_Kd = "160";
        min_temp = "0";
        max_temp = "295";
      };
      extruder1 = {
        step_pin = "P2.1";
        dir_pin = "!P0.11";
        enable_pin = "!P0.10";
        microsteps = "32";
        rotation_distance = "8.07";
        nozzle_diameter = "0.400";
        filament_diameter = "1.750";
        heater_pin = "P1.23";
        sensor_type = "ATC Semitec 104GT-2";
        sensor_pin = "P0.24";
        control = "pid";
        pid_Kp = "38.5";
        pid_Ki = "2.318";
        pid_Kd = "160";
        min_temp = "0";
        max_temp = "265";
      };
      heater_bed = {
        heater_pin = "P2.5";
        sensor_type = "Honeywell 100K 135-104LAG-J01";
        sensor_pin = "P0.25";
        control = "watermark";
        min_temp = "0";
        max_temp = "130";
      };

      "gcode_macro CANCEL_PRINT" = {
        description = "Cancel the actual running print";
        rename_existing = "CANCEL_PRINT_BASE";
        gcode = [ "TURN_OFF_HEATERS" "CANCEL_PRINT_BASE" ];
      };
      "gcode_macro T0" = {
        description = "change to tool 0 (high-temp)";
        gcode = [
          "SET_GCODE_OFFSET X=0 Y=0 Z=0 MOVE=1"
          "SAVE_GCODE_STATE"
          "G91"
          "G1 Z5"
          "G90"
          "G1 X220 Y15 F10000"
          "RESTORE_GCODE_STATE MOVE=1 MOVE_SPEED=100"
          "SET_GCODE_OFFSET X=0 Y=0 Z=0"
        ];
      };
      "gcode_macro T1" = {
        description = "change to tool 1 (normal)";
        gcode = [
          "SET_GCODE_OFFSET X=27.45 Y=-0.15 Z=1.6 MOVE=1"
          "SAVE_GCODE_STATE"
          "G91"
          "G1 Z5"
          "G90"
          "# X-10 - X27.45"
          "G1 X-37.45 Y15 F10000"
          "RESTORE_GCODE_STATE MOVE=1 MOVE_SPEED=100"
        ];
      };
      "gcode_macro TC_DEMO" = {
        gcode = [
          "G90"
          "G1 X100 Y100 Z20 F6000"
          "T1"
          "T0"
          "T1"
          "T0"
          "T1"
          "T0"
          "T1"
          "T0"
          "T1"
          "T0"
          "T1"
          "T0"
        ];
      };
    };
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
