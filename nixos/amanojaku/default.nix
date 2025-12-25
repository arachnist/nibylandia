{ config, pkgs, lib, inputs, ... }:

{
  networking.hostName = "amanojaku";

  imports = [ inputs.jovian-nixos.nixosModules.default ]
    ++ (with inputs.self.nixosModules; [ graphical laptop ]);

  boot.uefi.enable = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_jovian;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3ccaa83b-c3a3-478e-aa79-5310cf344c93";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9C71-46C1";
    fsType = "vfat";
  };

  services.displayManager.sddm.enable = lib.mkForce false;

  hardware.pulseaudio.enable = false;
  jovian.devices.steamdeck.enable = true;

  environment.systemPackages = with pkgs; [ maliit-keyboard maliit-framework kdePackages.plasma-keyboard ];
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };
  i18n.inputMethod.fcitx5 = {
    addons = with pkgs; [
      kdePackages.fcitx5-chinese-addons
      fcitx5-gtk
      kdePackages.fcitx5-qt
    ];
  };

  jovian.steam = {
    enable = true;
    autoStart = true;
    desktopSession = "plasma";
    user = "ar";
  };

  jovian.decky-loader.user = "ar";

  age.secrets.ar-password.file = ../../secrets/amanojaku-ar.age;
  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

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
