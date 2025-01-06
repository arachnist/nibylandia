{ config, inputs, pkgs, ... }:

{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    gaming
  ];

  # nixpkgs.overlays = [ inputs.nix-comfyui.overlays.default ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  services.fprintd.enable = true;

  age.secrets.ar-password.file = ../../secrets/kyorinrin-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework

    iio-sensor-proxy
    xournalpp

    # pkgs.comfyuiPackages.rocm.comfyui-with-extensions

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

  services.displayManager.sddm.settings.Fingerprintlogin = {
    Session = "plasma";
    User = "ar";
  };

  hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];

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

  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
    };
  in [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];
}
