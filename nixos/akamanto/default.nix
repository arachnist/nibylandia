{ config, pkgs, lib, inputs, ... }:

{
  # https://en.wikipedia.org/wiki/Aka_Manto
  networking.hostName = "akamanto";
  deployment.targetHost = "akamanto.waw.hackerspace.pl";

  imports = with inputs.self.nixosModules; [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    common
  ];
  sdImage.compressImage = false;
  hardware.enableRedistributableFirmware = true;
  boot = {
    kernelPackages = pkgs.linuxPackages_rpi3;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    supportedFilesystems = lib.mkForce [
      "btrfs"
      "cifs"
      "f2fs"
      "jfs"
      "ntfs"
      "reiserfs"
      "vfat"
      "xfs"
      "ext4"
      "vfat"
    ];
    # rpi kernel config misses a bunch of things
    initrd.includeDefaultModules = false;
  };

  # seems deprecated? will need to check later
  boot.loader.raspberryPi = {
    version = 3;
    firmwareConfig = # camera
      ''
        start_x=1
        gpu_mem=256
      '' + # normal clocks
      ''
        force_turbo=1
      '' + # audio
      ''
        dtparam=audio=on
      '';
  };
  # camera, kernel side
  boot.kernelModules = [ "bcm2835-v4l2" ];

  age.secrets.hswaw-wifi.file = ../../secrets/hswaw-wifi.age;
  networking = {
    useDHCP = false;
    wireless = {
      enable = true;
      environmentFile = config.age.secrets.hswaw-wifi.path;
      networks."hackerspace.pl-guests".psk = "@HSWAW_WIFI@";
      networks."hackerspace.pl-guests-5G".psk = "@HSWAW_WIFI@";
    };
  };

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
  users.mutableUsers = false;

  # strictly printer stuff below
  services.klipper = {
    enable = true;
    firmwares = {
      mcu = {
        enableKlipperFlash = true;
        enable = false;
        configFile = ./klipper-smoothie.cfg;
        serial = "/dev/ttyACM0";
      };
    };
    settings = {
      mcu.serial = "/dev/ttyACM0";
      printer = {
        kinematics = "corexy";
        max_velocity = 300;
        max_accel = 2000;
        max_z_velocity = 5;
        max_z_accel = 100;
      };
    };
  };

  services.moonraker = {
    user = "root";
    enable = true;
    address = "0.0.0.0";
    settings = {
      octoprint_compat = { };
      history = { };
      authorization = {
        force_logins = true;
        cors_domains = [ "*.local" "*.waw.hackerspace.pl" ];
        trusted_clients = [ "10.8.0.0/23" ];
      };
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
}
