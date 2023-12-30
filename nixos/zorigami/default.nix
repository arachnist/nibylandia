{ config, pkgs, lib, inputs, ... }:

{
  deployment.tags = [ "reachable-everywhere" ];

  imports = with inputs.self.nixosModules; [
    common
    secureboot
    monitoring
    ci-runners

    inputs.simple-nixos-mailserver.nixosModule

    ./hardware.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages;

  age.secrets.cassAuth = {
    file = ../../secrets/cassAuth.age;
    group = "nginx";
    mode = "440";
  };
  age.secrets.minecraftRestic.file = ../../secrets/norkclubMinecraftRestic.age;
  age.secrets.nextCloudAdmin = {
    file = ../../secrets/nextCloudAdmin.age;
    group = "nextcloud";
    mode = "440";
  };
  age.secrets.wgNibylandia.file = ../../secrets/wg/nibylandia_zorigami.age;

  age.secrets.arMail.file = ../../secrets/mail/ar.age;
  age.secrets.apoMail.file = ../../secrets/mail/apo.age;
  age.secrets.madargonMail.file = ../../secrets/mail/madargon.age;
  age.secrets.enkiMail.file = ../../secrets/mail/enki.age;
  age.secrets.matrixMail.file = ../../secrets/mail/matrix.age;
  age.secrets.mastodonMail.file = ../../secrets/mail/mastodon.age;
  age.secrets.mastodonPlainMail = {
    group = "mastodon";
    mode = "440";
    file = ../../secrets/mail/mastodonPlain.age;
  };
  age.secrets.vaultwardenMail.file = ../../secrets/mail/vaultwarden.age;
  age.secrets.vaultwardenPlainMail = {
    group = "vaultwarden";
    mode = "440";
    file = ../../secrets/mail/vaultwardenPlain.age;
  };

  age.secrets.minifluxCredentials.file = ../../secrets/miniflux.age;
  age.secrets.keycloakDatabase = {
    file = ../../secrets/keycloakDatabase.age;
    mode = "440";
  };
  age.secrets.keycloak.file = ../../secrets/mail/keycloak.age;

  age.secrets.notbotEnvironment.file = ../../secrets/notbotEnvironment.age;

  age.secrets.synapseExtraConfig = {
    group = "matrix-synapse";
    mode = "440";
    file = ../../secrets/synapseExtraConfig.age;
  };

  nibylandia.monitoring-server = { domain = "monitoring.is-a.cat"; };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    clientMaxBodySize = "4096m";
    appendHttpConfig = ''
      disable_symlinks off;
    '';
  };

  security.acme.acceptTerms = true;
  security.acme.defaults.email = "ar@is-a.cat";

  networking.firewall.allowedTCPPorts = [ 80 443 ] ++ [ 25565 25566 ]
    ++ [ 113 ];
  networking.firewall.allowedUDPPorts = [ 80 443 ]
    ++ [ 19132 19133 25565 25566 ] ++ [ 51315 ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_13;
  };
  services.prometheus.exporters.postgres = {
    enable = true;
    runAsLocalSuperUser = true;
    listenAddress = "127.0.0.1";
  };

  systemd.services.notbot = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Notbot irc bot service";
    serviceConfig = {
      Type = "simple";
      User = "bot";
      EnvironmentFile = config.age.secrets.notbotEnvironment.path;
      ExecStart = ''
        ${pkgs.notbot}/bin/notbot -nickname "notbot" -name "notbot" -user "bot" \
          -server "irc.libera.chat:6667" -password $NICKSERV_PASSWORD \
          -channels $CHANNELS -jitsi.channels $JITSI_CHANNELS -spaceapi.channels $SPACEAPI_CHANNELS
      '';
    };
  };
  users.users.bot = {
    isSystemUser = true;
    group = "bot";
  };
  users.groups.bot = { };

  systemd.services.cass = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "cass";
    serviceConfig = {
      Type = "simple";
      User = "ar";
      ExecStart = ''
        ${pkgs.cass}/bin/cass -listen "127.0.0.1:8000" -file-store "/srv/www/arachnist.is-a.cat/c" -url-base "https://ar.is-a.cat/c/"'';
    };
  };

  systemd.services.minecraft-overviewer = {
    script = ''
      ${pkgs.python3Packages.minecraft-overviewer}/bin/overviewer.py -p 8 -c "/srv/minecraft-overviewer/survival/config.py"
      ${pkgs.python3Packages.minecraft-overviewer}/bin/overviewer.py -p 8 -c "/srv/minecraft-overviewer/survival/config.py" --genpoi
    '';
    serviceConfig = {
      User = "minecraft";
      Group = "users";
      ProtectHome = "no";
    };
  };

  systemd.timers.minecraft-overviewer = {
    wantedBy = [ "multi-user.target" ];
    timerConfig = { OnCalendar = "daily"; };
  };

  users.users.minecraft = {
    isNormalUser = true;
    group = "users";
    openssh.authorizedKeys.keys =
      config.users.users.ar.openssh.authorizedKeys.keys ++ [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOHWPbzvwXTftY1r0dXcYZxT9QBnQkwepdMn8PCAPlYvYwUObEj3rgYrYRFrtCRWZVrKAdqBxnH9/6S9w631Zs7tgqEeDHJsotZNZV3qip7qGjn9IqUHXqF95MUDJV21AeBAqQ1xalefwCkwf/vYLFn8dSnsnlfO+mtlHZOuBED+SB2U1eNrWY2e45v8m7PqSyTCbCu0F3wVcHGwRFsxWA598wf85UBRVcSWVcUydE9F+PCS9sGETkXiRUDcHWnup8uygs4xLa9RADubhdGkUbQE6m6yOjvHJWZ4ov59zJh+hmpszCwfmUw/k39T2TM7tbwUWxgc68qDyaMGQr/Wzd x10a94@Celestia"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeJ+LSo3YXE6Jk6pGKL5om/VOi7XE5OvHA2U73V0pJXHa1bA4ityICeNqec2w8TSWSwTihJ4oAM7YLShkERNTcd1NWNHgUYova9nJ/nItFxrxDpTQsqK315u4d7nE+go09c85cyomHbDDcNVg9kJeCUjF+dr82N7JZfYVdQystOslOROYtl94GHuFHVOQyBRGeSztmakYvK1+3WV8dby6TfYG1l6uf6qLCg7q64zR4xDDP0KgfcrsusBQ6qYnKhop1fUTaW9NtEOQP/MhFLDp2YQmTsNJDiKAQpwwYLexWq4UcziXbnRfD56CHFHbW7Hu6Ltu35cHFKR2r9y4TBwTV crendgrim@gmx.de"
      ];
  };

  systemd.services.minecraft-backup = {
    script = ''
      export PATH="/run/current-system/sw/bin"
      /home/minecraft/minecraft-backup/backup.sh -w rcon -i /home/minecraft/survival/world -r $BACKUP_DESTINATION -s $RCON_AUTH -m -1
    '';
    serviceConfig = {
      User = "minecraft";
      Group = "users";
      ProtectHome = "no";
      EnvironmentFile = config.age.secrets.minecraftRestic.path;
    };
  };

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "cloud.is-a.cat";
    autoUpdateApps.enable = true;
    autoUpdateApps.startAt = "05:00:00";

    config = {
      overwriteProtocol = "https";

      adminuser = "admin";
      adminpassFile = config.age.secrets.nextCloudAdmin.path;

      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbname = "nextcloud";
      dbhost = "/run/postgresql";
    };
  };

  services.postgresql.ensureDatabases =
    [ "nextcloud" "matrix-synapse" "mastodon" ];
  services.postgresql.ensureUsers = [
    {
      name = "nextcloud";
      ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
    }
    {
      name = "matrix-synapse";
      ensurePermissions."DATABASE \"matrix-synapse\"" = "ALL PRIVILEGES";
    }
    {
      name = "mastodon";
      ensurePermissions."DATABASE mastodon" = "ALL PRIVILEGES";
    }
  ];

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

  mailserver = {
    enable = true;
    fqdn = "is-a.cat";
    domains = [ "is-a.cat" "i.am-a.cat" "rsg.enterprises" ];
    certificateScheme = "acme-nginx";
    enableManageSieve = true;
    fullTextSearch = {
      enable = true;
      memoryLimit = 2000;
    };
    localDnsResolver = false;
    monitoring.enable = false;
    borgbackup.enable = false;
    backup.enable = false;
    messageSizeLimit = 41943040;
    loginAccounts = {
      "ar@is-a.cat" = {
        aliases = [
          "arachnist@is-a.cat"
          "letsencrypt@is-a.cat"
          "gustaw.weldon@is-a.cat"
          "@rsg.enterprises"
          "@i.am-a.cat"
          "ari@is-a.cat"
        ];

        hashedPasswordFile = config.age.secrets.arMail.path;
      };
      "apo@is-a.cat".hashedPasswordFile = config.age.secrets.apoMail.path;
      "madargon@is-a.cat".hashedPasswordFile =
        config.age.secrets.madargonMail.path;
      "enkiusz@is-a.cat".hashedPasswordFile = config.age.secrets.enkiMail.path;
      "mastodon@is-a.cat".hashedPasswordFile =
        config.age.secrets.mastodonMail.path;
      "matrix@is-a.cat".hashedPasswordFile = config.age.secrets.matrixMail.path;
      "vaultwarden@is-a.cat".hashedPasswordFile =
        config.age.secrets.vaultwardenMail.path;
    };
  };

  services.matrix-synapse = {
    enable = true;
    settings = {
      server_name = "is-a.cat";

      registrations_require_3pid = [ "email" ];
      allowed_local_3pids = [{
        medium = "email";
        pattern = "^[^@]+@is-a.cat$";
      }];
      enable_registration = true;
      registration_requires_token = true;
      withJemalloc = true;
    };
    extraConfigFiles = [ config.age.secrets.synapseExtraConfig.path ];
  };

  services.mastodon = {
    enable = true;
    webProcesses = 4;
    streamingProcesses = 4;
    localDomain = "is-a.cat";
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
    };
    package = pkgs.glitchSoc;
  };

  services.vaultwarden = {
    enable = true;
    dbBackend = "postgresql";
    config = {
      DOMAIN = "https://vaultwarden.is-a.cat";
      ROCKET_PORT = "8222";
      ROCKET_ADDRESS = "127.0.0.1";
      databaseUrl = "postgresql://vaultwarden@%2Frun%2Fpostgresql/vaultwarden";

      smtpHost = "is-a.cat";
      smtpFrom = "vaultwarden@is-a.cat";
      smtpUsername = "vaultwarden@is-a.cat";
      smtpSecurity = "force_tls";

      signupsDomainsWhitelist = "is-a.cat";
    };
    environmentFile = config.age.secrets.vaultwardenPlainMail.path;
  };
  services.nginx.virtualHosts."vaultwarden.is-a.cat" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${
          toString config.services.vaultwarden.config.ROCKET_PORT
        }";
      proxyWebsockets = true;
    };
    locations."/notifications/hub" = {
      proxyPass = "http://localhost:3012";
      proxyWebsockets = true;
    };
    locations."/notifications/hub/negotiate" = {
      proxyPass = "http://localhost:8812";
      proxyWebsockets = true;
    };
  };

  # need to figure out something fancy about network configuration
  networking.hostName = "zorigami";

  systemd.network.wait-online.enable = false;
  networking.useDHCP = false;
  networking.interfaces.enp36s0f1.useDHCP = false;
  networking.interfaces.enp38s0.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = false;
  networking.interfaces.enp42s0f3u5u3c2.useDHCP = false;
  networking.tempAddresses = "disabled";
  networking.interfaces.enp36s0f0 = {
    useDHCP = false;
    ipv4 = {
      addresses = [{
        address = "185.236.240.137";
        prefixLength = 31;
      }];
      routes = [{
        address = "0.0.0.0";
        prefixLength = 0;
        via = "185.236.240.136";
      }];
    };
    ipv6 = {
      addresses = [{
        address = "2a0d:eb00:8007::10";
        prefixLength = 64;
      }];
      routes = [{
        address = "::";
        prefixLength = 0;
        via = "2a0d:eb00:8007::1";
      }];
    };
  };
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
    "1.1.1.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
    "2001:4860:4860::8888"
  ];
  boot.kernel.sysctl = {
    "net.ipv6.conf.all.accept_ra" = false;
    "net.ipv6.conf.default.accept_ra" = false;
    "net.ipv4.conf.all.forwarding" = true;
  };
  networking.wireguard.interfaces = {
    wg-nibylandia = {
      ips = [ "10.255.255.1/24" ];
      privateKeyFile = config.age.secrets.wgNibylandia.path;
      listenPort = 51315;

      peers = [
        {
          publicKey = "g/XhdVYsegn7Pp58Y1HFNxp4jhmA8YjRDg8W8J6swCw=";
          endpoint = "i.am-a.cat:51315";
          allowedIPs =
            [ "10.255.255.2/32" "192.168.20.0/24" "192.168.24.0/24" ];
          persistentKeepalive = 15;
        }
        {
          publicKey = "ubxtr3zW9F/ofjaQFnj6XpYcrOvTdOSW5wv06+VEehU=";
          allowedIPs = [ "10.255.255.3/32" ];
          persistentKeepalive = 15;
        }
        {
          publicKey = "tVH3q1AJZKsitYmASdaogMCBwhMCd8oSuDY2POpiUiY=";
          allowedIPs = [ "10.255.255.4/32" ];
          persistentKeepalive = 15;
        }
      ];
    };
  };

  services.nginx.virtualHosts = {
    "s.nork.club" = {
      forceSSL = true;
      enableACME = true;
      root = "/srv/www/s.nork.club";
    };
    "ar.is-a.cat" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = { root = "/srv/www/arachnist.is-a.cat"; };
      locations."/up" = {
        proxyPass = "http://127.0.0.1:8000";
        basicAuthFile = config.age.secrets.cassAuth.path;
        extraConfig = ''
          proxy_request_buffering off;
          proxy_send_timeout "9000s";
          proxy_read_timeout "9000s";
        '';
      };
      locations."/down" = {
        proxyPass = "http://127.0.0.1:8000";
        basicAuthFile = config.age.secrets.cassAuth.path;
        extraConfig = ''
          proxy_request_buffering off;
          proxy_send_timeout "9000s";
          proxy_read_timeout "9000s";
        '';
      };
    };
    "arachnist.is-a.cat" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = { root = "/srv/www/arachnist.is-a.cat"; };
    };
    "brata.zajeba.li" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = { root = "/srv/www/brata.zajeba.li"; };
    };
    "irc.is-a.cat" = {
      forceSSL = true;
      enableACME = true;
      locations."^~ /weechat" = {
        proxyPass = "http://127.0.0.1:9001";
        proxyWebsockets = true;
      };
      locations."/" = { root = pkgs.glowing-bear; };
    };
    "cloud.is-a.cat" = {
      forceSSL = true;
      enableACME = true;
    };
    ${config.services.matrix-synapse.settings.server_name} = {
      enableACME = true;
      forceSSL = true;

      locations."/_matrix" = { proxyPass = "http://127.0.0.1:8008"; };

      locations."/.well-known/matrix/server" = {
        return = ''
          200 "{\"m.server\":\"${config.services.matrix-synapse.settings.server_name}:443\",\"m.homeserver\":{\"base_url\":\"https://${config.services.matrix-synapse.settings.server_name}\"}}"'';
      };
    };
    "matrix.${config.services.matrix-synapse.settings.server_name}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        root = pkgs.cinny.override {
          conf = {
            homeserverList = [
              config.services.matrix-synapse.settings.server_name
              "matrix.hackerspace.pl"
            ];
            allowCustomHomeservers = false;
            defaultHomeserver = 0;
          };
        };
      };
    };
  };

  services.oidentd.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.openjdk17;
  };

  environment.systemPackages = with pkgs; [ john restic weechat ];
}
