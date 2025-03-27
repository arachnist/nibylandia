{
  description = "Nibylandia configurations";

  inputs = {
    nixpkgs.url = "git+file:///home/ar/scm/nixpkgs";
    # nixpkgs.url = "github:arachnist/nixpkgs/ar-patchset-unstable";
    nix-formatter-pack.url = "github:Gerschtli/nix-formatter-pack";
    deploy-rs.url = "github:serokell/deploy-rs";
    colmena.url = "github:zhaofengli/colmena/main";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    simple-nixos-mailserver = {
      # url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
      url = "github:arachnist/nixos-mailserver";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-comfyui.url = "github:dyscorv/nix-comfyui";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
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
          modules = [
            (./nixos/. + "/${name}")
            {
              nixpkgs.system = value.system;
            } # need to set this explicitly for colmena
          ];
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
