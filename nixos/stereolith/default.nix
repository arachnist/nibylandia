{ config, inputs, lib, pkgs, ... }:

{
  networking.hostName = "stereolith";
  networking.hostId = "adcad022";

  imports = with inputs.self.nixosModules; [ common ];

  boot.uefi.enable = true;

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "zfs" ];

  boot.enableContainers = true;
  boot.zfs.extraPools = [ config.networking.hostName ];
  boot.kernel.sysctl = { "net.ipv4.conf.all.forwarding" = "1"; };

  system.stateVersion = lib.mkForce "22.11";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/34409a0d-48ac-4dcb-8fe2-ac553b5b27f1";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3906-F639";
    fsType = "vfat";
  };

  nix.settings.max-jobs = 16;

  hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    tmux
    tcpdump
    sysstat
    samba
  ];

  programs = {
    neovim = {
      enable = true;
      withRuby = true;
      vimAlias = true;
      viAlias = true;
      defaultEditor = true;
    };
    mosh.enable = true;
  };

  networking.useDHCP = false;
  networking.wireless.enable = false;
  networking.nameservers = [ "192.168.20.1" ];
  networking.interfaces.enp9s0.ipv4 = {
    addresses = [{
      address = "192.168.20.31";
      prefixLength = 24;
    }];
    routes = [{
      address = "0.0.0.0";
      prefixLength = 0;
      via = "192.168.20.1";
    }];
  };
  systemd.network.wait-online.enable = false;

  networking.firewall.allowedTCPPorts = [ 22 80 443 1688 2005 2582 3000 ]
    ++ (map (x: 9091 + x) (lib.range (0 - 2) 10))
    ++ (map (x: 51413 + x) (lib.range (0 - 2) 10)) ++ [ 137 139 445 631 ]
    ++ [ 1143 1025 8080 ] ++ [ 5201 ] ++ [ 4000 4001 4002 ] ++ [ 5001 5050 ];
  networking.firewall.allowedUDPPorts = [ 69 2005 51820 ]
    ++ (map (x: 51413 + x) (lib.range (0 - 2) 10)) ++ [ 4000 4001 4002 ];

  users.users.minecraft = {
    isNormalUser = true;
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfIRe1nH6vwjQTjqHNnkKAdr1VYqGEeQnqInmf3A6UN ar@khas"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOHWPbzvwXTftY1r0dXcYZxT9QBnQkwepdMn8PCAPlYvYwUObEj3rgYrYRFrtCRWZVrKAdqBxnH9/6S9w631Zs7tgqEeDHJsotZNZV3qip7qGjn9IqUHXqF95MUDJV21AeBAqQ1xalefwCkwf/vYLFn8dSnsnlfO+mtlHZOuBED+SB2U1eNrWY2e45v8m7PqSyTCbCu0F3wVcHGwRFsxWA598wf85UBRVcSWVcUydE9F+PCS9sGETkXiRUDcHWnup8uygs4xLa9RADubhdGkUbQE6m6yOjvHJWZ4ov59zJh+hmpszCwfmUw/k39T2TM7tbwUWxgc68qDyaMGQr/Wzd x10a94@Celestia"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeJ+LSo3YXE6Jk6pGKL5om/VOi7XE5OvHA2U73V0pJXHa1bA4ityICeNqec2w8TSWSwTihJ4oAM7YLShkERNTcd1NWNHgUYova9nJ/nItFxrxDpTQsqK315u4d7nE+go09c85cyomHbDDcNVg9kJeCUjF+dr82N7JZfYVdQystOslOROYtl94GHuFHVOQyBRGeSztmakYvK1+3WV8dby6TfYG1l6uf6qLCg7q64zR4xDDP0KgfcrsusBQ6qYnKhop1fUTaW9NtEOQP/MhFLDp2YQmTsNJDiKAQpwwYLexWq4UcziXbnRfD56CHFHbW7Hu6Ltu35cHFKR2r9y4TBwTV crendgrim@gmx.de"
        "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAo6m9uCVY7aGJyOAIBt6kb/CmcHy4QXwGb4qoO7vNajJZTDg5lCuVT5hgap66a2HvYFgc4jO3g+ZVA3ogTa1DbhhFJdUmdJWu+4stcy++YASZlzH1gcUgfnXvlqAoNWygs8qnnj0sum87xGIE5EQaZ4LyRZKjwxkv/pvTjRS46eSNJfmyk7zcodF+akO8GtBhNmpEXI3CXnNWljfuQ8ZPvAsn+040I/Ro46E6RJvIqpTrnCDZMTvsCk2xrm+aIZZlqpdPj9RYyi94mZI6E5/2Dhdp5gqRKKQm+8PARHYLUR5naHW3sl5LzSU45s9vVu/9RTPwMBMDKdeNdIWOlkHlIhy8kVSGtTTQ4s5Pins2wJvz4RipnPoTWnNF8ugDOXbQ+F90GolHqnFhJOR5rloWFsuq2U/xrnXJXg7KbiNqUnW8osbuVZ9q9CJ6m8jBBwwhv/7kvI9Qe06SnrI3fm9RALp/zI4rudk866jcTqDt3wNQ1EqiJ8MrspyAWbQRL81jdTwghqSDDKMCKdWuYxXmo5ZOGo6D082IPk4MdPpRs9o9X6eJe8Ob1taZmyN69HDkZDX1NnXOp3zfNBSNNj3R8f8FBGgcyZ2PP3YgikCd5X+GlzkBByBIQCwZHdSoXl33xparX3GQeZgPVPjSCfHPTOcyDzzMMLPJh3sQS+Zawp8= dinnerbone-home-pc"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6rEwERSm/Fj4KO4SxFIo0BUvi9YNyf8PSL1FteMcMt arachnist@monolith"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM7WvV+4zRYrDoxXxLttLvIJkuzB3ZsHIUUmyc5Jp81F minecraft@orochi"
      ];
    };
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    commonHttpConfig = ''
      add_header X-Clacks-Overhead "GNU Terry Pratchett";
    '';

    virtualHosts = {
      "default" = {
        forceSSL = false;
        enableACME = false;
        serverName = "_";
        locations."/".return = "410";
        locations."/tftp/" = { alias = "/stereolith/crap/tftp/"; };
      };
      "i.am-a.cat" = {
        forceSSL = true;
        enableACME = true;
        locations."/transmission/Downloads/" = {
          alias = "/stereolith/crap/transmission/Downloads/";
          extraConfig = ''
            autoindex on;
            satisfy any;

            allow 192.168.20.0/24;
            allow 192.168.24.0/24;
            allow 10.255.255.0/24;
            deny all;

            auth_basic "crap";
            auth_basic_user_file "/etc/nginx/auth/crap";
          '';
        };
      };

      "drukarke.zajeba.li" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:5001";
          proxyWebsockets = true;
          extraConfig = ''
            satisfy any;

            allow 192.168.20.0/24;
            allow 192.168.24.0/24;
            allow 10.255.255.0/24;
            deny all;

            auth_basic "octoprint";
            auth_basic_user_file "/etc/nginx/auth/octoprint";

            client_max_body_size 0;
          '';
        };
      };

      "185.102.189.133" = {
        forceSSL = false;
        locations."/.well-known/pki-validation/" = {
          alias = "/stereolith/crap/pki-validation/";
        };
      };

      "picture.cat" = {
        locations."/" = { root = "/stereolith/photo/_build"; };
      };

    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "ar@is-a.cat";
  };

  services.printing = {
    enable = true;
    startWhenNeeded = false;
    browsing = true;
    listenAddresses = [ "*:631" ];
    defaultShared = true;
    drivers = with pkgs; [ cups-dymo ];
  };
  services.samba = {
    enable = true;
    package = pkgs.samba4Full;
    shares = {
      scan = {
        browseable = "yes";
        comment = "Scanner";
        "guest ok" = "yes";
        path = "/stereolith/scan";
        "read only" = false;
      };
      transmission = {
        browseable = "yes";
        comment = "Scanner";
        "guest ok" = "yes";
        path = "/stereolith/crap/transmission/Downloads";
        "read only" = false;
        "force user" = "transmission";
        "force group" = "transmission";
      };
      annscratch = {
        browseable = "yes";
        comment = "scratch";
        "guest ok" = "yes";
        path = "/stereolith/scratch/anna";
        "read only" = false;
      };
      photo = {
        browseable = "yes";
        comment = "photo";
        "guest ok" = "yes";
        path = "/stereolith/photo";
        "read only" = false;
        "force user" = "arachnist";
        "force group" = "users";
      };
      labelprinter = {
        path = "/var/spool/samba";
        printer = "labelprinter";
        browseable = "yes";
        comment = "Label Printer";
        "guest ok" = "yes";
        writable = "no";
        printable = "yes";
        public = "yes";
        "create mode" = 700;
      };
    };
    extraConfig = ''
      load printers = yes
      printing = cups
      printcap name = cups
    '';
  };
  systemd.tmpfiles.rules = [ "d /var/spool/samba 1777 root root -" ];
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  services.xserver.enable = false;
  systemd.services.mdmonitor.enable = false;

  services.transmission = {
    enable = true;
    downloadDirPermissions = "775";
    settings = {
      rpc-port = 9091;
      peer-port = 51413;
      rpc-bind-address = "192.168.20.31";
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = true;
      rpc-host-whitelist = "stereolith.nibylandia.lan";
      download-dir = "/stereolith/crap/transmission/Downloads";
      incomplete-dir = "/stereolith/crap/transmission/Downloads";
      dht-enabled = false;
      pex-enabled = false;
    };
  };

  virtualisation.oci-containers.containers = {
    octoprint = {
      image = "octoprint/octoprint";
      volumes = [ "octoprint:/octoprint" ];
      ports = [ "5001:80" ];
      extraOptions = [
        "--device=/dev/ttyACM0:/dev/ttyACM0"
        "--device=/dev/video0:/dev/video0"
        "--device=/dev/video1:/dev/video1"
      ];
      environment = {
        ENABLE_MJPG_STREAMER = "true";
        MJPG_STREAMER_INPUT = "-r 1920x1080 -f 30";
      };
    };
  };

  security.polkit.enable = true;
  virtualisation.libvirtd.enable = true;

  services.pykms.enable = true;
}
