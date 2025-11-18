{ lib, stdenv, fetchzip, ... }:

stdenv.mkDerivation {
  pname = "sound-theme-undertunes";
  version = "0.1";

  src = fetchzip {
    url = "https://ar.is-a.cat/c/d3ffe93ee12422328ee478b56fe777ff99622eb6.zip";
    hash = "sha256-suBJ8FIz9DsIFA9+mr3GJ93N5wi5cD4TguZbMFt6qns=";
  };

  installPhase = ''
    mkdir -p $out/share/sounds/Undertale
    cp -r * $out/share/sounds/Undertale
  '';

  meta = with lib; {
    description = "sound effects from Undertale";
    homepage = "https://store.kde.org/p/2322141";
    platforms = with platforms; unix;
  };
}
