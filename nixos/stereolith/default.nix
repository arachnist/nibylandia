{ config, inputs, lib, pkgs, ... }:

{
  age.secrets.mastodonPlainMail = {
    group = "mastodon";
    mode = "440";
    file = ../../secrets/mail/mastodonPlain.age;
  };
  age.secrets.mastodonActiveRecordSecrets.file =
    ../../secrets/mastodon-qa-activerecord.age;

  networking.hostName = "stereolith";
  networking.hostId = "adcad022";

  imports = with inputs.self.nixosModules; [ common ];

  boot.uefi.enable = true;

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.supportedFilesystems = [ "zfs" ];
  boot.kernelPackages = pkgs.linuxPackages;
  boot.zfs.package = pkgs.zfs_2_1;
  boot.extraModulePackages = with config.boot.kernelPackages; [ zfs_2_1 ];

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
        forceSSL = true;
        enableACME = true;
        locations = {
          "/" = { root = "/stereolith/photo/_build"; };
          "/jp-unsorted/" = {
            alias = "/stereolith/photo/unsorted-old/";
            extraConfig = ''
              autoindex on;
            '';
          };
        };
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
  hardware.pulseaudio.enable = false;
  services.xserver.enable = false;
  systemd.services.mdmonitor.enable = false;

  services.transmission = {
    enable = true;
    downloadDirPermissions = "775";
    settings = {
      rpc-port = 9091;
      peer-port = 51413;
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = false;
      download-dir = "/stereolith/crap/transmission/Downloads";
      incomplete-dir = "/stereolith/crap/transmission/Downloads";
      dht-enabled = false;
      pex-enabled = false;
    };
    webHome = pkgs.flood-for-transmission;
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

  #users.groups.mastodon = { members = [ "nginx"]; };
  services.mastodon = {
    enable = true;
    webProcesses = 4;
    streamingProcesses = 4;
    localDomain = "social-qa.of-a.cat";
    configureNginx = true;
    smtp = {
      user = "mastodon@is-a.cat";
      passwordFile = config.age.secrets.mastodonPlainMail.path;
      fromAddress = "mastodon@is-a.cat";
      host = "is-a.cat";
      createLocally = false;
      authenticate = true;
    };
    extraConfig = {
      EMAIL_DOMAIN_ALLOWLIST = "is-a.cat";
      MAX_TOOT_CHARS = "20000";
      MAX_PINNED_TOOTS = "10";
      MAX_BIO_CHARS = "2000";
      MAX_PROFILE_FIELDS = "8";
      MAX_POLL_OPTIONS = "10";
      MAX_IMAGE_SIZE = "33554432";
      MAX_VIDEO_SIZE = "167772160";
      ALLOWED_PRIVATE_ADDRESSES = "127.1.33.7";
      GITHUB_REPOSITORY = "arachnist/mastodon/tree/meow";
      MAX_REACTIONS = "10";
    };
    extraEnvFiles = [ config.age.secrets.mastodonActiveRecordSecrets.path ];
    package = pkgs.glitch-soc;
  };
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "mastodon" ];
    ensureUsers = [
      {
        name = "mastodon";
        ensureDBOwnership = true;
      }
    ];
  };
}
