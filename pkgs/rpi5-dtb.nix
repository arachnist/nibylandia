{ stdenv, fetchurl, ... }:

let
  dtbVersion = "1e403e23baab5673f0494a200f57cd01287d5b1a";
  fileName = "bcm2712-rpi-5-b.dtb";
in stdenv.mkDerivation {
  pname = "rpi5-dtb";
  version = "20240316";

  src = fetchurl {
    url =
      "https://github.com/raspberrypi/firmware/raw/${dtbVersion}/boot/${fileName}";
    hash = "sha256-xUMqzINz+mMR4UciG4ulyGhblXcwr6x1ksXerCsn5zI=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/
    cp $src $out/${fileName}

    runHook postInstall
  '';
}
