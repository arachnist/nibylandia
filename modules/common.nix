{ config, lib, pkgs, ... }:

let secrets = import ../secrets.nix;
in {
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
    bash.enableCompletion = true;
    mosh.enable = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs; [
    deploy-rs
    file
    git
    go
    libarchive
    lm_sensors
    lshw
    lsof
    pciutils
    pry
    pv
    strace
    usbutils
    wget
    zip
    config.boot.kernelPackages.perf
    age
    sshfs
    dig
    dstat
    htop
    iperf
    whois
    xxd
    tcpdump
    traceroute
    age
    cfssl
    gomuks
    bind
    nmap
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
}
