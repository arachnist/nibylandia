{ config, inputs, pkgs, ... }:


{
  networking.hostName = "kyorinrin";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    laptop
    secureboot
  ];

  nixpkgs.overlays = [
    inputs.nix-comfyui.overlays.default
  ];

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

    pkgs.comfyuiPackages.rocm.comfyui-with-extensions
  ];

  services.displayManager.sddm.settings.Fingerprintlogin = {
    Session = "plasma";
    User = "ar";
  };

  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  systemd.tmpfiles.rules =
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
}
