{ config, ... }:

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
  };

  systemd.services.factorio.serviceConfig.LoadCredential = [
    "factorio-server-password:${config.age.secrets.factorio-server-password.path}"
  ];
}
