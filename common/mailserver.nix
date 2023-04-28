{ config, lib, ... }:

let cfg = config.my.mailserver;
in {
  options = {
    my.mailserver = {
      enable = lib.mkEnableOption "Enable a mailserver";
      fqdn = lib.mkOption { type = lib.types.str; };
      domains = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "List of handled domains";
      };
      users = lib.mkOption { type = lib.types.attrs; };
    };
  };

  config = lib.mkIf cfg.enable {
    mailserver = {
      enable = true;
      fqdn = cfg.fqdn;
      domains = cfg.domains;
      certificateScheme = 3;
      loginAccounts = cfg.users;
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
    };

    services.rspamd.extraConfig = ''
      actions {
        reject = null; # Disable rejects, default is 15
        add_header = 5; # Add header when reaching this score
        greylist = null; # Apply greylisting when reaching this score
      }
    '';

    services.rspamd.locals = {
      "groups.conf".text = ''
        symbols = {
          "BAYES_SPAM" { weight = 7; }
          "BAYES_HAM" { weight = -5; }
          "R_SPF_ALLOW" { weight = 0; }
          "R_DKIM_ALLOW" { weight = 0; }
          "DMARC_POLICY_ALLOW" { weight = 0; }
          "MIME_HEADER_CTYPE_ONLY" { weight = 0; }
          "NEURAL_HAM" { weight = -5; }
          "SUBJECT_NEEDS_ENCODING" { weight = 0; }
          "INVALID_MSGID" { weight = 0; }
        }'';
    };
  };
}
