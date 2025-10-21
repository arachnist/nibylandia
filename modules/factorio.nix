{ config, pkgs, ... }:

{
  age.secrets = {
    factorio-server-password.file =
      ../secrets/factorio-server-password-${config.networking.hostName}.age;
  };

  services.factorio = {
    enable = true;
    openFirewall = true;
    requireUserVerification = false;
    loadLatestSave = true;
    game-name = "the mines";
    extraSettingsFile =
      "/run/credentials/factorio.service/factorio-server-password";

    mods = [
      (pkgs.stdenv.mkDerivation {
        name = "q3k-mod-collection";
        src = builtins.fetchTarball {
          url =
            "https://object.ceph-eu.hswaw.net/q3k-personal/393c44deb2bd221803ab53e8968753d5698d4728c72eb2a1a6b9303177a250d7.tar";
          sha256 =
            "sha256:03rm2wa071ryz9mncz78a969kj2m51s8x9vz688a3ss4ggzylkkj";
        };
        installPhase = ''
          mkdir $out
          cp $src/*zip $out/
        '';
        deps = [ ];
      })
    ];
  };

  systemd.services.factorio.serviceConfig.LoadCredential = [
    "factorio-server-password:${config.age.secrets.factorio-server-password.path}"
  ];
}
