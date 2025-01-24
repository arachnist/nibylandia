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
