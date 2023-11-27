{ config, pkgs, lib, inputs, ... }:

{
  networking.hostName = "khas";
  deployment.targetHost = "khas.nibylandia.lan";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
    gaming
  ];

  boot.kernelPatches = with lib.kernel; [{
    name = "disable transparent hugepages for virtio-gpu";
    patch = null;
    extraStructuredConfig = { TRANSPARENT_HUGEPAGE = lib.mkForce no; };
  }];
  # disabling transparent hugepages should fix it
  nixpkgs.overlays = [ inputs.microvm.overlay ];
  microvm.vms = {
    # elementVm = { config = import ../../microvms/elementVm.nix; };
  };

  age.secrets.ar-password.file = ../../secrets/khas-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 ];
}
