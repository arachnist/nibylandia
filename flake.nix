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
    colmena = {
      url = "github:zhaofengli/colmena/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    , agenix, lanzaboote, microvm, simple-nixos-mailserver, colmena, ...
    }@inputs:
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
      inherit (nixpkgs) lib;
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

      nixosModules = {
        nibylandia-boot.imports = [ ./modules/boot.nix ];

        nibylandia-secureboot.imports = [ ./modules/secureboot.nix ];

        nibylandia-common.imports = [ ./modules/common.nix ];

        nibylandia-graphical.imports = [ ./modules/graphical.nix ];

        nibylandia-laptop.imports = [ ./modules/laptop.nix ];

        nibylandia-gaming.imports = [ ./modules/gaming.nix ];

        nibylandia-monitoring.imports = [ ./modules/monitoring.nix ];

        nibylandia-ci-runners.imports = [ ./modules/ci-runners.nix ];
      };

      nixosConfigurations = builtins.mapAttrs (name: value:
        nixpkgs.lib.nixosSystem {
          inherit (value) system;
          modules = [ (./. + "/nixos/${name}") ];
          extraModules = [ inputs.colmena.nixosModules.deploymentOptions ];
          specialArgs = { inherit inputs; };
        }) {
          scylla.system = "aarch64-linux";
          khas.system = "x86_64-linux";
          microlith.system = "x86_64-linux";
          zorigami.system = "x86_64-linux";
        };

      deploy.nodes = builtins.mapAttrs (name: value: {
        fastConnection = false;
        remoteBuild = true;
        hostname = value.config.deployment.targetHost;
        profiles.system = {
          user = "root";
          sshUser = "root";
          path =
            deployPkgs.${value.config.nixpkgs.system}.deploy-rs.lib.activate.nixos
            value;
        };
      }) self.nixosConfigurations;

      colmena = {
        meta = {
          nixpkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
          nodeNixpkgs =
            builtins.mapAttrs (_: v: v.pkgs) self.nixosConfigurations;
          nodeSpecialArgs = builtins.mapAttrs (_: v: v._module.specialArgs)
            self.nixosConfigurations;
          specialArgs.lib = lib;
        };
      } // builtins.mapAttrs (_: v: { imports = v._module.args.modules; })
        self.nixosConfigurations;

      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
