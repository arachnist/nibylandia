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
    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-formatter-pack, nix-index-database, deploy-rs
    , agenix, lanzaboote, microvm, simple-nixos-mailserver, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
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

      overlays = import ./overlays;

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
            nixpkgs.overlays = [ self.overlays.nibylandia ];
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

        nibylandia-monitoring.imports = [ ./modules/monitoring.nix ];

        nibylandia-ci-runners.imports = [
          ({ config, pkgs, lib, ... }:
            let gitea-runner-directory = "/var/lib/gitea-runner";
            in {
              age.secrets.gitea-runner-token = {
                file = ./secrets/gitea-runner-token-${config.networking.hostName}.age;
              };

              services.gitea-actions-runner.instances.nix = {
                enable = true;
                name = config.networking.hostName;
                tokenFile = config.age.secrets.gitea-runner-token.path;
                labels = [ "nixos-${pkgs.system}:host" "nixos:host" "self-hosted-${pkgs.system}" "self-hosted" ];
                url = "https://code.hackerspace.pl";
                settings = {
                  cache.enabled = true;
                  host.workdir_parent =
                    "${gitea-runner-directory}/action-cache-dir";
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
            })
        ];
      };

      nixosConfigurations = with self.nixosModules; {
        scylla = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            nibylandia-common
            nibylandia-ci-runners

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

            ({ config, pkgs, lib, ... }: {
              boot.kernelPatches = with lib.kernel; [{
                name = "disable transparent hugepages for virtio-gpu";
                patch = null;
                extraStructuredConfig = {
                  TRANSPARENT_HUGEPAGE = lib.mkForce no;
                };
              }];
            })

            # appears to be broken for me for some reason            
            {
              nixpkgs.overlays = [ microvm.overlay ];
              microvm.vms = {
                elementVm = {
                  # pkgs = import nixpkgs { system = "x86_64-linux"; };
                  config = import ./microvms/elementVm.nix;
                };
              };
            }

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

        zorigami = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nibylandia-common
            nibylandia-secureboot
            nibylandia-monitoring
            nibylandia-ci-runners

            simple-nixos-mailserver.nixosModule

            ./nixos/zorigami
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

      deploy.nodes.zorigami = {
        fastConnection = false;
        remoteBuild = true;
        hostname = "zorigami";
        profiles.system = {
          user = "root";
          sshUser = "root";
          path = deployPkgs.x86_64-linux.deploy-rs.lib.activate.nixos
            self.nixosConfigurations.zorigami;
        };
      };

      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
