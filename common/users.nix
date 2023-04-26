{ config, lib, secrets, pkgs, ... }:

{
  config = {
    users.mutableUsers = false;

    users.defaultUserShell = pkgs.zsh;

    users.groups.ar = { gid = 1000; };
    users.users.ar = {
      isNormalUser = true;
      uid = 1000;
      group = "ar";
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
      ];
      hashedPassword = lib.mkDefault null;
      openssh.authorizedKeys.keys = config.my.secrets.userDB.ar.keys;
    };

    users.users.root = {
      openssh.authorizedKeys.keys = config.my.secrets.userDB.ar.keys;
    };
  };
}
