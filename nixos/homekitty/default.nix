{ config, inputs, lib, pkgs, ... }:

{
  networking.hostName = "homekitty";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    gaming
  ];

  # nixpkgs.overlays = [ inputs.nix-comfyui.overlays.default ];
  boot.uefi.enable = true;
  boot.loader.systemd-boot.xbootldrMountPoint = "/efi";
  boot.loader.systemd-boot.edk2-uefi-shell.enable = true;
  boot.loader.systemd-boot.windows."10".efiDeviceHandle = "HD0b";
  boot.loader.systemd-boot.windows."10-alternative".efiDeviceHandle = "HD1b";
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework

    iio-sensor-proxy
    xournalpp

    woeusb-ng
    ntfs3g

    bison
    flex
    fontforge
    makeWrapper
    pkg-config
    gnumake
    gcc
    libiconv
    autoconf
    automake
    libtool
  ];

  networking.networkmanager.ensureProfiles.profiles = {
    "38C3" = {
      connection = {
        id = "38C3";
        type = "wifi";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "38C3";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        anonymous-identity = "38C3";
        eap = "ttls;";
        identity = "allowany";
        password = "allowany";
        phase2-auth = "pap";
        altsubject-matches = "DNS:radius.c3noc.net";
        ca-cert = "${builtins.fetchurl {
          url = "https://letsencrypt.org/certs/isrgrootx1.pem";
          sha256 =
            "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
        }}";
      };
      ipv4 = { method = "auto"; };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };

  users.mutableUsers = lib.mkForce true;

  users.groups.miau = { gid = 1001; };
  users.users.miau = {
    isNormalUser = true;
    uid = 1001;
    group = "miau";
    extraGroups = [
      "users"
      "wheel"
      "systemd-journal"
      "docker"
      "vboxusers"
      "podman"
      "tss"
      "nitrokey"
      "tss"
      "plugdev"
      "video"
      "dialout"
      "networkmanager"
    ];
  };
}
