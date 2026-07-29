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
          url = "https://ar.is-a.cat/c/0799b5d91fc28cdbc1ed0a2a3c9c3fb3964040c4.tar";
          sha256 = "sha256:135r47gvac59vlmqikhf87i27whb85qp3wc1bkd34yjwxdv321z4";
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
