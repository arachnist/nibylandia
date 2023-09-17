{
  description = "Nibylandia configurations";

  inputs = {
    nixpkgs.url = "github:arachnist/nixpkgs/ar-patchset-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
    nix-index-database.url = "github:Mic92/nix-index-database";
    deploy-rs.url = "github:serokell/deploy-rs";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "";
    };
  };

  outputs = { self, nixpkgs, nix-formatter-pack, nix-index-database, deploy-rs
    , agenix, ... }:
    let forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
    in {
      # forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);
      formatter = forAllSystems (system:
        nix-formatter-pack.lib.mkFormatter {
          inherit nixpkgs system;

          config = {
            tools = {
              deadnix = {
                enable = true;
                noLambdaPatternNames = true;
                noLambdaArg = true;
              };
              statix.enable = true;
              nixfmt.enable = true;
            };
          };
        });

      nixosConfigurations = {
        scylla = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nix-index-database.nixosModules.nix-index
            agenix.nixosModules.default
            ./nixos/scylla/configuration.nix
          ];
        };
      };

      deploy.nodes.scylla = {
        fastConnection = false;
        remoteBuild = true;
        hostname = "i.am-a.cat";
        profiles.system = {
          user = "root";
          sshUser = "root";
          path = deploy-rs.lib.aarch64-linux.activate.nixos
            self.nixosConfigurations.scylla;
        };
      };

      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
