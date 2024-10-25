{ pkgs, config, inputs, ... }:

{
  networking.hostName = "microlith";

  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    graphical
    gaming
    secureboot
  ];
  age.secrets.ar-password.file = ../../secrets/microlith-ar.age;

  users.users.ar.hashedPasswordFile = config.age.secrets.ar-password.path;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 8080 8188 ];

  # nixpkgs.overlays = [ inputs.nix-comfyui.overlays.default ];

  # environment.systemPackages =
  #   [ pkgs.comfyuiPackages.rocm.comfyui-with-extensions ];

  hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];

  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
    };
  in [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];
}
