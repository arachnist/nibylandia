{ config, pkgs, lib, ... }:

# this just sets up the scaffolding surrounding the server, the actual
# minecraft server is managed manually, for now
let cfg = config.my.minecraft-server;
in {
  options = {
    my.minecraft-server = {
      enable = lib.mkEnableOption "Enable the minecraft server scaffolding";
      sshKeys = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "ssh keys of people who have access here";
      };
      backupSchedule = lib.mkOption {
        type = lib.types.str;
        description = "backup schedule, passed on to systemd timer OnCalendar";
        default = "*:0/15";
      };
      backupScript = lib.mkOption {
        type = lib.types.str;
        description = "backup script";
      };
      backupAuthEnvFile = lib.mkOption {
        type = lib.types.str;
        description = "backup authentication environment file";
      };
      overviewerUpdateSchedule = lib.mkOption {
        type = lib.types.str;
        description =
          "map update schedule, passed on to systemd timer OnCalendar";
        # default = "*:0/15";
        default = "daily";
      };
      overviewerConfigLocation = lib.mkOption {
        type = lib.types.str;
        description = "location of the overviewer configuration";
      };
      overviewerParallelism = lib.mkOption {
        type = lib.types.ints.u8;
        description = "number of cpu cores to use for map generation";
      };
      tcpPorts = lib.mkOption {
        type = lib.types.listOf lib.types.port;
        description = "tcp ports to open";
      };
      udpPorts = lib.mkOption {
        type = lib.types.listOf lib.types.port;
        description = "udp ports to open";
      };
      javaPackage = lib.mkOption {
        type = lib.types.package;
        description = "Version of java to enable";
        default = pkgs.openjdk17;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.minecraft-overviewer = {
      # this isn't obvious, but newlines in ${} don't matter
      script = ''
        ${pkgs.python3Packages.minecraft-overviewer}/bin/overviewer.py -p ${
          builtins.toString cfg.overviewerParallelism
        } -c "${cfg.overviewerConfigLocation}"
        ${pkgs.python3Packages.minecraft-overviewer}/bin/overviewer.py -p ${
          builtins.toString cfg.overviewerParallelism
        } -c "${cfg.overviewerConfigLocation}" --genpoi
      '';
      serviceConfig = {
        User = "minecraft";
        Group = "users";
        ProtectHome = "no";
      };

    };

    systemd.timers.minecraft-overviewer = {
      wantedBy = [ "multi-user.target" ];
      timerConfig = { OnCalendar = cfg.overviewerUpdateSchedule; };
    };

    systemd.services.minecraft-backup = {
      script = cfg.backupScript;
      serviceConfig = {
        User = "minecraft";
        Group = "users";
        ProtectHome = "no";
        EnvironmentFile = cfg.backupAuthEnvFile;
      };
    };

    systemd.timers.minecraft-backup = {
      wantedBy = [ "multi-user.target" ];
      timerConfig = { OnCalendar = cfg.backupSchedule; };
    };

    users.users.minecraft = {
      isNormalUser = true;
      group = "users";
      openssh.authorizedKeys.keys = cfg.sshKeys;
      packages = [ pkgs.python3Packages.minecraft-overviewer ];
    };

    networking.firewall.allowedTCPPorts = cfg.tcpPorts;
    networking.firewall.allowedUDPPorts = cfg.udpPorts;

    programs.java = {
      enable = true;
      package = cfg.javaPackage;
    };

    environment.systemPackages = with pkgs; [ restic ];
  };
}
