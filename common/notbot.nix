{ config, lib, pkgs, ... }:

let
  cfg = config.my.notbot;
  listOpts = f: l:
    if lib.lists.length l > 0 then
      "${f} " + builtins.concatStringsSep " ${f} " (map (x: ''"${x}"'') l)
    else
      "";
in {
  options.my.notbot = {
    enable = lib.mkEnableOption "Enable the notbot irc bot";
    nickname = lib.mkOption {
      type = lib.types.str;
      description = "irc nickname";
      default = "notbot";
    };
    name = lib.mkOption {
      type = lib.types.str;
      default = "notbot";
      description = "irc realname";
    };
    user = lib.mkOption {
      type = lib.types.str;
      default = "bot";
      description = "irc bot username";
    };
    server = lib.mkOption {
      type = lib.types.str;
      description = "irc server";
      default = "irc.libera.chat:6667";
    };
    nickServPassword = lib.mkOption {
      type = lib.types.str;
      description = "NickServ password";
    };
    channels = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of irc channels to join";
    };
    jitsiChannels = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of jitsi channels to monitor";
    };
    spaceApiChannels = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of spaceApi endpoints to monitor";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.notbot = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "Notbot irc bot service";
      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        ExecStart = ''
                    ${pkgs.notbot}/bin/notbot -nickname "${cfg.nickname}" -name "${cfg.name}" -user "${cfg.user}" \
          			-server "${cfg.server}" -password "${cfg.nickServPassword}" \
          			${listOpts "-channels" cfg.channels} \
          			${listOpts "-jitsi.channels" cfg.jitsiChannels} \
          			${listOpts "-spaceapi.channels" cfg.spaceApiChannels}
          		'';
      };
    };
    users.users.${cfg.user} = {
      isSystemUser = true;
      group = cfg.user;
    };
    users.groups.${cfg.user} = { };
  };
}
