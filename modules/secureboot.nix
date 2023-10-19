{ config, lib, inputs, ... }:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
  age.secrets = {
    secureboot-cert.file = ../secrets/secureboot-cert.age;
    secureboot-key.file = ../secrets/secureboot-key.age;
  };

  boot.lanzaboote = {
    enable = true;
    publicKeyFile = config.age.secrets.secureboot-cert.path;
    privateKeyFile = config.age.secrets.secureboot-key.path;
  };

  nibylandia-boot.uefi.enable = lib.mkForce false;
}
