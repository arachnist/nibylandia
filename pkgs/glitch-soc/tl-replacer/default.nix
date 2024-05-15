{ stdenv, ruby }:

stdenv.mkDerivation {
  pname = "tl-replacer";
  version = "0.2";
  src = ./.;

  buildInputs = [ ruby ];
  installPhase = ''
    mkdir -p $out
    cp -r $src/tl-replacer* $out
  '';
}
