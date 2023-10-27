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
  services.klipper = {
    enable = true;
    mutableConfig = true;
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
    environment = { GDK_BACKEND = "wayland"; };
  };
  systemd.services."cage-tty1".serviceConfig.Restart = "always";
}
