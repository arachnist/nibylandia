{ config, pkgs, inputs, ... }:

let
  keaJsonWithIncludes = name: value:
    pkgs.callPackage ({ runCommand, jq, gnused }:
      runCommand name {
        nativeBuildInputs = [ jq gnused ];
        value = builtins.toJSON value;
        passAsFile = [ "value" ];
      } ''
        jq . "$valuePath" | \
          sed -r -e 's@["]__keaInclude ([^"]+)["]@<?include "\1"?>@g'> $out
      '') { };

  dn42_roa_update = pkgs.writeShellScriptBin "dn42_roa_update" ''
    mkdir -p /etc/bird/
    ${pkgs.curl}/bin/curl -sfSLR {-o,-z}/etc/bird/roa_dn42_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf
    ${pkgs.curl}/bin/curl -sfSLR {-o,-z}/etc/bird/roa_dn42.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf
    ${pkgs.bird3}/bin/birdc c
    ${pkgs.bird3}/bin/birdc reload in all
  '';
in {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    ci-runners
  ];

  boot.uefi.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams =
      [ "arm-smmu.disable_bypass=0" "pci=pcie_bus_perf" "iommu.passthrough=1" ];
    # Setup SFP+ network interfaces early so systemd can pick everything up.
    initrd.extraUtilsCommands = ''
      copy_bin_and_libs ${pkgs.restool}/bin/restool
      copy_bin_and_libs ${pkgs.restool}/bin/ls-main
      copy_bin_and_libs ${pkgs.restool}/bin/ls-addni
      # Patch paths
      sed -i "1i #!$out/bin/sh" $out/bin/ls-main
    '';
    initrd.postDeviceCommands = ''
      ls-addni dpmac.7
      ls-addni dpmac.8
      ls-addni dpmac.9
      ls-addni dpmac.10
    '';
    kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = true;

      "net.ipv6.conf.all.accept_ra" = 0;
      "net.ipv6.conf.all.autoconf" = 0;
      "net.ipv6.conf.all.use_tempaddr" = 0;
    };
  };

  age.secrets = {
    wgNibylandiaScylla.file = ../../secrets/wg/nibylandia_scylla.age;
    wgDN42Scylla.file = ../../secrets/wg/dn42_w1kl4s_scylla.age;
    ddnsKeyKea = {
      file = ../../secrets/lan/nibylandia-ddns-kea.age;
      mode = "444";
    };
    ddnsKeyBind = {
      file = ../../secrets/lan/nibylandia-ddns-bind.age;
      mode = "400";
      owner = "named";
      group = "named";
    };
  };

  networking.hostName = "scylla";

  networking.wireless.enable = false;

  time.timeZone = "Europe/Warsaw";

  systemd.network.enable = true;
  networking.useNetworkd = true;
  networking.useDHCP = false;
  networking.interfaces = {
    eth0 = {
      useDHCP = true;
      macAddress = "50:7b:9d:b5:fa:e8";
    };
    lan = {
      ipv4.addresses = [{
        address = "192.168.24.1";
        prefixLength = 24;
      }];
    };
    eth1 = {
      ipv4.addresses = [{
        address = "192.168.20.1";
        prefixLength = 24;
      }];
    };
  };
  networking.nameservers = [ "192.168.20.1" ];
  networking.vlans = {
    lan = {
      id = 10;
      interface = "eth1";
    };
  };
  networking.wireguard.interfaces = {
    wg-nibylandia = {
      ips = [ "10.255.255.2/24" ];
      privateKeyFile = config.age.secrets.wgNibylandiaScylla.path;
      listenPort = 51315;
      allowedIPsAsRoutes = true;

      peers = [{
        publicKey = "xwTYtejNZCtOyPMNcZVlsBIGYae6aUQczh7UwujLxXg=";
        allowedIPs = [ "10.255.255.0/24" ];
        # endpoint = "zorigami.is-a.cat:51315";
        endpoint = "185.236.240.137:51315";
        persistentKeepalive = 15;
      }];
    };
    dn42_w1kl4s_1 = {
      ips = [ "fd25:af2d:1f51:255::1/64" "fe80::255:acab/64" ];
      privateKeyFile = config.age.secrets.wgDN42Scylla.path;
      listenPort = 51516;
      allowedIPsAsRoutes = false;

      peers = [{
        publicKey = "zNP632K1qrezFIl8NQK1tR3XEdYHat/YgzdCXnFIWDE=";
        allowedIPs = [ "0.0.0.0/0" "::/0" ];
        endpoint = "193.31.26.15:53137";
      }];
    };
  };
  systemd.network.networks.dn42_w1kl4s_1 = {
    matchConfig.Name = "dn42_w1kl4s_1";
    addresses = [{
      Address = "172.20.148.161";
      Peer = "172.23.193.2/32";
    }];
  };

  networking.firewall.enable = true;
  networking.firewall.logRefusedConnections = false;
  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "lan" "eth1" "virbr1" "virbr2" ];
    forwardPorts = [
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.101.2:22";
        sourcePort = 11520;
        proto = "tcp";
      } # sdomi's vm

      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:22";
        sourcePort = 23;
        proto = "tcp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.32:22";
        sourcePort = 32;
        proto = "tcp";
      }
      {
        destination = "192.168.20.31";
        sourcePort = 2582;
        proto = "tcp";
      }

      {
        destination = "192.168.20.31";
        sourcePort = "51411:51423";
        proto = "tcp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:80";
        sourcePort = 80;
        proto = "tcp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:443";
        sourcePort = 443;
        proto = "tcp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:2005";
        sourcePort = 2005;
        proto = "tcp";
      }

      {
        destination = "192.168.20.31";
        sourcePort = "51411:51423";
        proto = "udp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:80";
        sourcePort = 80;
        proto = "udp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:443";
        sourcePort = 443;
        proto = "udp";
      }
      {
        loopbackIPs = [ "185.102.189.133" ];
        destination = "192.168.20.31:2005";
        sourcePort = 2005;
        proto = "udp";
      }
    ];
  };
  networking.firewall.allowedTCPPorts = [
    179 # bgp
    53
    5201
    6443 # k3s
  ];
  networking.firewall.allowedUDPPorts = [
    179 # bgp
    53
    51315
    51516 # dn42-w1kl4s
  ];
  networking.firewall.interfaces."eth1".allowedTCPPorts = [ 8123 ];
  networking.firewall.interfaces."lan".allowedTCPPorts = [ 8123 ];
  systemd.network.wait-online.extraArgs = [ "--any" ];

  services.k3s = {
    enable = false;
    role = "server";
  };

  services.kea = {
    dhcp4 = {
      enable = true;
      settings = {
        interfaces-config = {
          interfaces = [ "lan/192.168.24.1" "eth1/192.168.20.1" ];
        };

        lease-database = {
          name = "/var/lib/kea/dhcp4.leases";
          persist = true;
          type = "memfile";
        };

        rebind-timer = 2000;
        renew-timer = 1000;
        valid-lifetime = 4000;

        dhcp-ddns = {
          enable-updates = true;
          ncr-protocol = "UDP";
          ncr-format = "JSON";
          server-ip = "127.0.0.1";
          server-port = 53001;
        };

        ddns-send-updates = true;
        ddns-replace-client-name = "when-not-present";
        ddns-update-on-renew = true;
        ddns-override-client-update = true;
        ddns-override-no-update = true;

        subnet4 = [
          {
            id = 1;
            subnet = "192.168.24.0/24";
            pools = [{ pool = "192.168.24.40 - 192.168.24.240"; }];
            reservations-out-of-pool = true;
            reservations-in-subnet = true;
            ddns-qualifying-suffix = "nibylandia.lan.";
            option-data = [
              {
                name = "routers";
                data = "192.168.24.1";
              }
              {
                name = "domain-name-servers";
                data = "192.168.24.1";
              }
            ];

            reservations = [{
              hw-address = "34:15:13:b6:2a:e7";
              hostname = "yamaha";
              ip-address = "192.168.24.11";
            }];
          }
          {
            id = 2;
            subnet = "192.168.20.0/24";
            pools = [{ pool = "192.168.20.40 - 192.168.20.240"; }];
            reservations-out-of-pool = true;
            reservations-in-subnet = true;
            ddns-qualifying-suffix = "nibylandia.lan.";

            option-data = [
              {
                name = "routers";
                data = "192.168.20.1";
              }
              {
                name = "domain-name-servers";
                data = "192.168.20.1";
              }
            ];

            reservations = [
              {
                hw-address = "00:02:c9:53:9a:c2";
                hostname = "stereolith";
                ip-address = "192.168.20.31";
              }
              {
                hw-address = "00:30:93:12:0f:bf";
                hostname = "microlith";
                ip-address = "192.168.20.32";
              }
            ];
          }
        ];
      };
    };

    dhcp-ddns = {
      enable = true;
      configFile = keaJsonWithIncludes "kea-dhcp-ddns.conf" {
        DhcpDdns = {
          dns-server-timeout = 100;
          ip-address = "127.0.0.1";
          ncr-format = "JSON";
          ncr-protocol = "UDP";
          forward-ddns = {
            ddns-domains = [{
              key-name = "bind-key-2021-12-27";
              dns-servers = [{ ip-address = "192.168.20.1"; }];
              name = "nibylandia.lan.";
            }];
          };
          reverse-ddns = {
            ddns-domains = [
              {
                key-name = "bind-key-2021-12-27";
                dns-servers = [{ ip-address = "192.168.20.1"; }];
                name = "20.168.192.in-addr.arpa.";
              }
              {
                key-name = "bind-key-2021-12-27";
                dns-servers = [{ ip-address = "192.168.20.1"; }];
                name = "24.168.192.in-addr.arpa.";
              }
            ];
          };
          tsig-keys = [{
            name = "bind-key-2021-12-27";
            algorithm = "HMAC-SHA512";
            secret = "__keaInclude ${config.age.secrets.ddnsKeyKea.path}";
          }];
        };
      };
    };
  };

  services.bind = {
    enable = true;
    listenOn = [ "192.168.20.1" "192.168.24.1" ];
    forwarders = [ "8.8.8.8" "1.1.1.1" "8.8.4.4" "1.0.0.1" ];
    cacheNetworks = [ "192.168.20.0/24" "192.168.24.0/24" ];
    zones = {
      "nibylandia.lan" = {
        master = true;
        file = "/var/lib/bind/nibylandia.lan.zone";
        extraConfig = ''
          allow-update { key "bind-key-2021-12-27"; };
        '';
      };
      "20.168.192.in-addr.arpa" = {
        master = true;
        file = "/var/lib/bind/20.168.192.in-addr.arpa.zone";
        extraConfig = ''
          allow-update { key "bind-key-2021-12-27"; };
        '';
      };
      "24.168.192.in-addr.arpa" = {
        master = true;
        file = "/var/lib/bind/24.168.192.in-addr.arpa.zone";
        extraConfig = ''
          allow-update { key "bind-key-2021-12-27"; };
        '';
      };
    };
    extraConfig = ''
      key "bind-key-2021-12-27" {
        algorithm hmac-sha512;
        include "${config.age.secrets.ddnsKeyBind.path}";
      };
    '';
    extraOptions = ''
      dnssec-validation no;
    '';
  };

  services.bird = {
    enable = true;
    checkConfig = false;
    package = pkgs.bird2;
    config = builtins.readFile ./bird/bird2.conf;
  };
  environment.etc."bird/peers/w1kl4s.conf" = {
    source = ./bird/peers_w1kl4s.conf;
  };
  systemd.timers.dn42-roa = {
    description = "Trigger a ROA table update";

    timerConfig = {
      OnBootSec = "5m";
      OnUnitInactiveSec = "1h";
      Unit = "dn42-roa.service";
    };

    wantedBy = [ "timers.target" ];
    before = [ "bird.service" ];
  };

  services.tailscale = {
    useRoutingFeatures = "both";
    extraUpFlags = [
      "--advertise-exit-node"
      "--advertise-routes=172.20.0.0/14"
      "--advertise-routes=fd00::/8"
    ];
  };

  systemd.services = {
    dn42-roa = {
      after = [ "network.target" ];
      description = "DN42 ROA Updated";
      unitConfig = { Type = "one-shot"; };
      serviceConfig = { ExecStart = "${dn42_roa_update}/bin/dn42_roa_update"; };
    };
  };

  security.polkit.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

  services.avahi = {
    enable = true;
    reflector = true;
    allowInterfaces = [ "lan" "eth1" ];
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays =
    [ (self: super: { restool = self.callPackage ./pkgs/restool { }; }) ];

  environment.systemPackages = with pkgs; [ restool ethtool ];
}
