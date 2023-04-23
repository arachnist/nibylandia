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
  };

  outputs = { self, nixpkgs, home-manager, agenix, bootspec-secureboot
    , lanzaboote, deploy-rs }@inputs:
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
    };
}
