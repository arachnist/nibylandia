{
  description = "Nibylandia configurations";

  inputs = {
    nixpkgs.url = "github:arachnist/nixpkgs/ar-patchset-unstable";
    bootspec-secureboot = {
      url = "github:DeterminateSystems/bootspec-secureboot/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

  outputs = { self, nixpkgs, bootspec-secureboot, nix-formatter-pack
    , nix-index-database, deploy-rs, agenix, ... }:
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

      nixosModules = with self.nixosModules; {
        nibylandia-boot.imports = [ ./modules/boot.nix ];

        nibylandia-secureboot.imports = [
          bootspec-secureboot.nixosModules.bootspec-secureboot

          ({ config, lib, ... }: {
            age.secrets = {
              secureboot-cert.file = ./secrets/secureboot-cert.age;
              secureboot-key.file = ./secrets/secureboot-key.age;
            };

            boot.loader.secureboot = {
              enable = true;
              signingKeyPath = "${config.age.secrets.secureboot-key.path}";
              signingCertPath = "${config.age.secrets.secureboot-cert.path}";
            };
            nibylandia-boot.uefi.enable = lib.mkForce false;
          })
        ];

        nibylandia-common.imports = [
          nix-index-database.nixosModules.nix-index
          agenix.nixosModules.default

          nibylandia-boot

          ./modules/common.nix
        ];

        nibylandia-graphical.imports = [
          nibylandia-common

          ./modules/graphical.nix
        ];

        nibylandia-laptop.imports = [ ./modules/laptop.nix ];
      };

      nixosConfigurations = with self.nixosModules; {
        scylla = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nibylandia-common

            ./nixos/scylla
          ];
        };

        khas = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nibylandia-graphical
            nibylandia-laptop
            nibylandia-secureboot

            ./nixos/khas
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
