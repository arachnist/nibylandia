{ config, pkgs, ... }:

let
  gitea-runner-directory = "/var/lib/gitea-runner";
  meta = import ../meta.nix;
  ci-packages = with pkgs; [
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
    envsubst
  ];
  ci-labels = [
    "nixos-${pkgs.system}:host"
    "nixos:host"
    "self-hosted-${pkgs.system}"
    "self-hosted"
  ];
in {
  age.secrets = {
    gitea-runner-token.file =
      ../secrets/gitea-runner-token-${config.networking.hostName}.age;
    github-runner-token.file =
      ../secrets/github-runner-token-${config.networking.hostName}.age;
    ci-secrets = { # for printer host sd images
      file = ../secrets/ci-secrets.age;
      mode = "444";
    };
  };

  services.github-runners."nix-${config.networking.hostName}" = {
    enable = true;
    extraLabels = ci-labels;
    tokenFile = config.age.secrets.github-runner-token.path;
    url = "https://github.com/arachnist/nibylandia";

    extraPackages = ci-packages;
  };

  services.gitea-actions-runner.package = pkgs.forgejo-runner;
  services.gitea-actions-runner.instances.nix = {
    enable = true;
    name = config.networking.hostName;
    tokenFile = config.age.secrets.gitea-runner-token.path;
    labels = ci-labels;
    url = "https://code.hackerspace.pl";
    settings = {
      cache.enabled = true;
      host.workdir_parent = "${gitea-runner-directory}/action-cache-dir";
    };

    hostPackages = ci-packages;
  };

  systemd.services.gitea-runner-nix.environment = {
    XDG_CONFIG_HOME = gitea-runner-directory;
    XDG_CACHE_HOME = "${gitea-runner-directory}/.cache";
  };

  nix.sshServe = {
    enable = true;
    protocol = "ssh";
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeC/Nr7STpYEZ50p7X+XrFdeaIfib60tt2QN4Kvxscr"
    ] ++ meta.users.ar;
  };
}
