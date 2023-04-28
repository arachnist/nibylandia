{ config, lib, pkgs, ... }:

let cfg = config.my.mastodon;
in {
  options = {
    my.mastodon = {
      enable = lib.mkEnableOption "Enable mastodon";
      domain = lib.mkOption {
        type = lib.types.str;
        description = "Domain name for mastodon instance";
      };
      smtpUser = lib.mkOption {
        type = lib.types.str;
        description = "smtp user for mastodon";
      };
      smtpPasswordFile = lib.mkOption { type = lib.types.path; };
    };
  };

  config = {
    services.mastodon = {
      enable = cfg.enable;
      webProcesses = 4;
      localDomain = cfg.domain;
      configureNginx = true;
      smtp = {
        user = cfg.smtpUser;
        passwordFile = cfg.smtpPasswordFile;
        fromAddress = cfg.smtpUser;
        host = cfg.domain;
        createLocally = false;
        authenticate = true;
      };

      extraConfig = {
        EMAIL_DOMAIN_ALLOWLIST = cfg.domain;
        MAX_TOOT_CHARS = "20000";
        MAX_PINNED_TOOTS = "10";
        MAX_BIO_CHARS = "2000";
        MAX_PROFILE_FIELDS = "8";
        MAX_POLL_OPTIONS = "10";
        MAX_IMAGE_SIZE = "33554432";
        MAX_VIDEO_SIZE = "167772160";
        ALLOWED_PRIVATE_ADDRESSES = "127.1.33.7";

      };
      package = pkgs.glitchSoc;
    };

    services.postgresql.ensureDatabases = [ "mastodon" ];
    services.postgresql.ensureUsers = [{
      name = "mastodon";
      ensurePermissions."DATABASE mastodon" = "ALL PRIVILEGES";
    }];
  };
}
