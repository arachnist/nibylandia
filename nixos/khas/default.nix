{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  zfsCompatibleKernelPackages = lib.filterAttrs (
    name: kernelPackages:
    (builtins.match "linux_[0-9]+_[0-9]+" name) != null
    && (builtins.tryEval kernelPackages).success
    && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
  ) pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in
{
  networking.hostName = "khas";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    # gaming
  ];

  # boot.kernelParams = [ "nohz_full=1-15" ];

  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [
    8000
    8080
  ];

  # boot.kernelModules = [ "zfs" ];
  environment.systemPackages = with pkgs; [
    zfs
  ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    zfs_unstable
  ];
  boot.kernelPackages = latestKernelPackage;

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
