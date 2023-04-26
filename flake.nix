{
  description = "NixOS machines configuration";

  inputs = {
    nixpkgs.url = "github:arachnist/nixpkgs/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
      };
    };

    bootspec-secureboot = {
      url = "github:DeterminateSystems/bootspec-secureboot/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, agenix, bootspec-secureboot
    , lanzaboote, deploy-rs, simple-nixos-mailserver }@inputs:
    let
      pkgs = nixpkgs.legacyPackages.${builtins.currentSystem};

      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

      architecture = "x86_64-linux";

      mkSystem = { extraModules, architecture ? "x86_64-linux" }:
        nixpkgs.lib.nixosSystem {
          system = architecture;
          modules = [
            agenix.nixosModules.age
            home-manager.nixosModules.home-manager

            ({ config, ... }: {
              system.configurationRevision = self.sourceInfo.rev;
              services.getty.greetingLine =
                "<<< Welcome to NixOS ${config.system.nixos.label} @ ${self.sourceInfo.rev} - \\l >>>";

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              nixpkgs.overlays = [
                (import ./overlays/minecraft.nix)
                (import ./overlays/my-stuff.nix)
                (import ./overlays/fedi.nix)
              ];

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

              services.openssh = {
                enable = true;
                openFirewall = true;
                settings.PasswordAuthentication = false;
              };
              programs.mosh.enable = true;

            })
          ] ++ extraModules;
        };
    in {
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = [
              deploy-rs.packages.${system}.deploy-rs
              agenix.packages.${system}.agenix
            ];
          };
        });

      nixosModules = {
        boot = import ./common/boot.nix;
        cass = import ./common/cass.nix;
        gaming-client = import ./common/gaming-client.nix;
        graphical = import ./common/graphical.nix;
        interactive = import ./common/interactive.nix;
        irc = import ./common/irc.nix;
        laptop = import ./common/laptop.nix;
        mailserver = import ./common/mailserver.nix;
        mastodon = import ./common/mastodon.nix;
        matrix-server = import ./common/matrix-server.nix;
        minecraft = import ./common/minecraft.nix;
        miniflux = import ./common/miniflux.nix;
        monitoring = import ./common/monitoring.nix;
        nextcloud = import ./common/nextcloud.nix;
        nginx = import ./common/nginx.nix;
        notbot = import ./common/notbot.nix;
        postgresql = import ./common/postgresql.nix;
        users = import ./common/users.nix;
        vaultwarden = import ./common/vaultwarden.nix;
      };
    };
}
