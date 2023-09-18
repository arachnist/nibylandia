{ config, lib, pkgs, ... }:

{
  config = {
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
    ];

    documentation = {
      man.enable = true;
      doc.enable = true;
      dev.enable = true;
      info.enable = true;
      nixos.enable = true;
    };
  };
}
