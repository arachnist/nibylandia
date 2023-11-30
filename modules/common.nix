{ config, lib, pkgs, inputs, ... }:

let secrets = import ../secrets.nix;
in {
  imports = with inputs; [
    nix-index-database.nixosModules.nix-index
    agenix.nixosModules.default

    microvm.nixosModules.host

    self.nixosModules.boot
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  deployment = {
    allowLocalDeployment = true;
    buildOnTarget = true;
  };

  age.secrets.nix-store.file = ../secrets/nix-store.age;

  boot.binfmt.emulatedSystems =
    lib.lists.remove pkgs.system [ "x86_64-linux" "aarch64-linux" ];
  programs.command-not-found.enable = false;
  system.stateVersion = "23.11";
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };
  programs = {
    mtr.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    zsh = {
      enable = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh.enable = true;
    };
    tmux = {
      enable = true;
      terminal = "screen256-color";
      clock24 = true;
    };
    ssh.knownHosts = builtins.mapAttrs (name: value: {
      inherit (value) publicKey;
      extraHostNames = [ value.targetHost ];
    }) secrets.hosts;
    bash.enableCompletion = true;
    mosh.enable = true;
  };

  deployment.targetHost =
    lib.mkDefault secrets.hosts.${config.networking.hostName}.targetHost;

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      trusted-users = [ "ar" "root" ];
      substituters = (if config.networking.hostName != "scylla" then
        [
          "ssh://nix-ssh@i.am-a.cat?trusted=1&ssh-key=${config.age.secrets.nix-store.path}"
        ]
      else
        [ ]) ++ (if config.networking.hostName != "zorigami" then
          [
            "ssh://nix-ssh@is-a.cat?trusted=1&ssh-key=${config.age.secrets.nix-store.path}"
          ]
        else
          [ ]);
      trusted-substituters = (if config.networking.hostName != "scylla" then
        [
          "ssh://nix-ssh@i.am-a.cat?trusted=1&ssh-key=${config.age.secrets.nix-store.path}"
        ]
      else
        [ ]) ++ (if config.networking.hostName != "zorigami" then
          [
            "ssh://nix-ssh@is-a.cat?trusted=1&ssh-key=${config.age.secrets.nix-store.path}"
          ]
        else
          [ ]);
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.overlays = [ inputs.self.overlays.nibylandia ];

  environment.systemPackages = with pkgs; [
    file
    git
    libarchive
    lm_sensors
    lshw
    lsof
    pciutils
    pv
    strace
    usbutils
    wget
    zip
    # config.boot.kernelPackages.perf
    age
    dstat
    htop
    iperf
    xxd
    tcpdump
    traceroute
    jq
  ];

  documentation = {
    man.enable = true;
    doc.enable = true;
    dev.enable = true;
    info.enable = true;
    nixos.enable = true;
  };

  users.users.root.openssh.authorizedKeys.keys = secrets.ar;

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
      "plugdev"
      "video"
      "dialout"
      "networkmanager"
    ];
    hashedPassword = lib.mkDefault null;
    openssh.authorizedKeys.keys = secrets.ar;
  };

  console.keyMap = "us";
  i18n = {
    defaultLocale = "en_CA.UTF-8";
    supportedLocales = [
      "en_CA.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "en_DK.UTF-8/UTF-8"
      "pl_PL.UTF-8/UTF-8"
    ];
  };
  time.timeZone = "Europe/Warsaw";

  systemd.network = {
    enable = true;
    netdevs.virbr0.netdevConfig = {
      Kind = "bridge";
      Name = "virbr0";
    };
    networks.virbr0 = {
      matchConfig.Name = "virbr0";
      # Hand out IP addresses to MicroVMs.
      # Use `networkctl status virbr0` to see leases.
      networkConfig = {
        DHCPServer = true;
        IPv6SendRA = true;
      };
      addresses = [
        { addressConfig.Address = "10.0.0.1/24"; }
        { addressConfig.Address = "fd12:3456:789a::1/64"; }
      ];
      ipv6Prefixes = [{ ipv6PrefixConfig.Prefix = "fd12:3456:789a::/64"; }];
    };
    networks.microvm-eth0 = {
      matchConfig.Name = "vm-*";
      networkConfig.Bridge = "virbr0";
    };
  };
}
