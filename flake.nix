{
  description = "Nibylandia configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
    nix-index-database.url = "github:Mic92/nix-index-database";
    deploy-rs.url = "github:serokell/deploy-rs";
    microvm.url = "github:astro/microvm.nix";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-formatter-pack, nix-index-database, deploy-rs
    , agenix, lanzaboote, microvm, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
      pkgsForDeploy =
        forAllSystems (system: import nixpkgs { inherit system; });
      deployPkgs = forAllSystems (system:
        let pkgs = pkgsForDeploy.${system};
        in import nixpkgs {
          inherit system;
          overlays = [
            deploy-rs.overlay
            (self: super: {
              deploy-rs = {
                inherit (pkgs) deploy-rs;
                inherit (super.deploy-rs) lib;
              };
            })
          ];
        });
    in {
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
          lanzaboote.nixosModules.lanzaboote

          ({ config, lib, ... }: {
            age.secrets = {
              secureboot-cert.file = ./secrets/secureboot-cert.age;
              secureboot-key.file = ./secrets/secureboot-key.age;
            };

            boot.lanzaboote = {
              enable = true;
              publicKeyFile = config.age.secrets.secureboot-cert.path;
              privateKeyFile = config.age.secrets.secureboot-key.path;
            };

            nibylandia-boot.uefi.enable = lib.mkForce false;
          })
        ];

        nibylandia-common.imports = [
          nix-index-database.nixosModules.nix-index
          agenix.nixosModules.default

          microvm.nixosModules.host

          nibylandia-boot

          ({ pkgs, ... }: {
            environment.systemPackages =
              [ agenix.packages.${pkgs.system}.default ];
          })

          ./modules/common.nix
        ];

        nibylandia-graphical.imports = [
          nibylandia-common

          ./modules/graphical.nix
        ];

        nibylandia-laptop.imports = [ ./modules/laptop.nix ];

        nibylandia-gaming.imports = [ ./modules/gaming.nix ];
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
            nibylandia-gaming

            ./nixos/khas
          ];
        };

        microlith = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nibylandia-graphical
            nibylandia-gaming
            nibylandia-secureboot

            ./nixos/microlith
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
          path = deployPkgs.aarch64-linux.deploy-rs.lib.activate.nixos
            self.nixosConfigurations.scylla;
        };
      };

      deploy.nodes.khas = {
        fastConnection = false;
        remoteBuild = true;
        hostname = "khas";
        profiles.system = {
          user = "root";
          sshUser = "root";
          path = deployPkgs.x86_64-linux.deploy-rs.lib.activate.nixos
            self.nixosConfigurations.khas;
        };
      };

      deploy.nodes.microlith = {
        fastConnection = false;
        remoteBuild = true;
        hostname = "microlith.nibylandia.lan";
        profiles.system = {
          user = "root";
          sshUser = "root";
          path = deployPkgs.x86_64-linux.deploy-rs.lib.activate.nixos
            self.nixosConfigurations.microlith;
        };
      };

      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
