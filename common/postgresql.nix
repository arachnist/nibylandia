{ config, lib, pkgs, ... }:

{
  options.my.postgresql.enable = lib.mkEnableOption "Enable postgresql DB";

  config = lib.mkIf config.my.postgresql.enable {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_13;
    };
    services.prometheus.exporters.postgres = {
      enable = true;
      runAsLocalSuperUser = true;
      listenAddress = "127.0.0.1";
    };
  };
}
