{ config, pkgs, ... }:

{
  age.secrets = {
    factorio-server-password.file = ../secrets/factorio-server-password-${config.networking.hostName}.age;
  };

  services.factorio = {
    enable = true;
    openFirewall = true;
    requireUserVerification = false;
    loadLatestSave = true;
    game-name = "the mines";
    extraSettingsFile = "/run/credentials/factorio.service/factorio-server-password";
    mods = [
      (pkgs.stdenv.mkDerivation {
        name = "the-mines-mod-collection";
        src = fetchTarball {
          url = "https://ar.is-a.cat/c/fc6d082331fdd22165c8877e8c0d826c95a151ac.tar";
          sha256 = "sha256:1lh2n48fw6p6073pdj7qm65604rihfrkds0kb346xjps4p2wj2c2";
        };
        deps = [ ];
        installPhase = ''
          mkdir $out
          cp $src/*zip $out
        '';
      })
    ];
    admins = [
      "arachnist"
    ];
    package = pkgs.factorio-headless-experimental;
  };

  systemd.services.factorio.serviceConfig.LoadCredential = [
    "factorio-server-password:${config.age.secrets.factorio-server-password.path}"
  ];
}
