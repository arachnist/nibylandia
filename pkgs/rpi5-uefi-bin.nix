{ stdenv, lib, fetchzip }:

let version = "v0.3";
in stdenv.mkDerivation {
  pname = "rpi5-uefi-bin";
  inherit version;

  src = fetchzip {
    url =
      "https://github.com/worproject/rpi5-uefi/releases/download/${version}/RPi5_UEFI_Release_${version}.zip";
    sha256 = "sha256-bjEvq7KlEFANnFVL0LyexXEeoXj7rHGnwQpq09PhIb0=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/boot
    mv ./* $out/boot

    runHook postInstall
  '';

  meta = with lib; { description = "EDK2 port for raspberry pi 5"; };
}
