{ config, inputs, pkgs, ... }:

{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    # gaming
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
    kdePackages.plasma-keyboard

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

    krita
  ];

  services.displayManager.sddm.settings.Fingerprintlogin = {
    Session = "plasma";
    User = "ar";
  };

  # hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  #
  # systemd.tmpfiles.rules = let
  #   rocmEnv = pkgs.symlinkJoin {
  #     name = "rocm-combined";
  #     paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
  #   };
  # in [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];
  networking.networkmanager.ensureProfiles.profiles = {
    "39C3" = {
      connection = {
        id = "39C3";
        type = "wifi";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "39C3";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        anonymous-identity = "39C3";
        eap = "ttls;";
        identity = "39C3";
        password = "39C3";
        phase2-auth = "pap";
        altsubject-matches = "DNS:radius.c3noc.net";
        ca-cert = "${builtins.fetchurl {
          url = "https://letsencrypt.org/certs/isrgrootx1.pem";
          sha256 = "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
        }}";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
    };
  };
}
