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

  # silly NIC networking
  networking.interfaces.enp198s0f4u1i1.ipv4 = {
    addresses = [{
      address = "10.70.0.254";
      prefixLength = 24;
    }];
  };
  services.dnsmasq = {
    enable = true;
    settings = {
      interface = [ "enp2s0f0u4i1" ];

      no-resolv = true;
      port = 553;
      listen-address = [ "10.70.0.254" ];
      dhcp-range = [
        "enp198s0f4u1i1,10.70.0.10,10.70.0.250,5m"
      ];
      enable-ra = true;

      enable-tftp = true;
      tftp-root = "/stereolith/crap/tftp";
      tftp-no-fail = true;

      log-queries = true;
      log-dhcp = true;
    };
  };
  networking.firewall.trustedInterfaces = [ "enp2s0f0u4i1" ];
  boot.kernel.sysctl = {
    "net.ipv4.conf.enp198s0f4u1i1.forwarding" = 0;

    "net.ipv6.conf.enp198s0f4u1i1.forwarding" = 0;
  };

  networking.networkmanager.unmanaged = [ "enp2s0f0u4i1" ];
}
