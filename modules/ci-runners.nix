{ config, pkgs, lib, ... }:

let gitea-runner-directory = "/var/lib/gitea-runner";
in {
  age.secrets.gitea-runner-token = {
    file = ../secrets/gitea-runner-token-${config.networking.hostName}.age;
  };

  services.gitea-actions-runner.instances.nix = {
    enable = true;
    name = config.networking.hostName;
    tokenFile = config.age.secrets.gitea-runner-token.path;
    labels = [
      "nixos-${pkgs.system}:host"
      "nixos:host"
      "self-hosted-${pkgs.system}"
      "self-hosted"
    ];
    url = "https://code.hackerspace.pl";
    settings = {
      cache.enabled = true;
      host.workdir_parent = "${gitea-runner-directory}/action-cache-dir";
    };

    hostPackages = with pkgs; [
      bash
      coreutils
      curl
      gawk
      git-lfs
      nixFlakes
      gitFull
      gnused
      nodejs
      wget
      jq
      nixos-rebuild
    ];
  };

  systemd.services.gitea-runner-nix.environment = {
    XDG_CONFIG_HOME = gitea-runner-directory;
    XDG_CACHE_HOME = "${gitea-runner-directory}/.cache";
  };

  nix.sshServe = {
    enable = true;
    protocol = "ssh-ng";
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeC/Nr7STpYEZ50p7X+XrFdeaIfib60tt2QN4Kvxscr"
    ];
  };
}
