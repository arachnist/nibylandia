{
  description = "Nibylandia configurations";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url =
      #  "github:arachnist/nixpkgs/klipper-firmwares-package-overrides";
      "github:arachnist/nixpkgs/ar-patchset-unstable";
    #  "git+file:/home/ar/scm/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
    nix-index-database.url = "github:Mic92/nix-index-database";
    deploy-rs.url = "github:serokell/deploy-rs";
    microvm.url = "github:astro/microvm.nix";
    impermanence.url = "github:nix-community/impermanence";
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

  outputs = { self, nixpkgs, deploy-rs, ... }@inputs:
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
      meta = import ./meta.nix;
    in {
      formatter = forAllSystems (system:
        inputs.nix-formatter-pack.lib.mkFormatter {
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

      nixosModules = lib.mapAttrs' (name: value:
        lib.nameValuePair (builtins.replaceStrings [ ".nix" ] [ "" ] name) {
          imports = [ (./modules/. + "/${name}") ];
        }) (builtins.readDir ./modules);

      nixosConfigurations = builtins.mapAttrs (name: value:
        nixpkgs.lib.nixosSystem {
          inherit (value) system;
          modules = [ (./nixos/. + "/${name}") ];
          extraModules = [ inputs.colmena.nixosModules.deploymentOptions ];
          specialArgs = { inherit inputs; };
        }) meta.hosts;

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
