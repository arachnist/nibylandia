{ stdenv, lib, ruby, makeWrapper, getent # /etc/passwd
, ncurses # tput
, binutils-unwrapped # strings
, coreutils, findutils }:

# No gems used, so mkDerivation is fine.
let
  additionalPath =
    lib.makeBinPath [ getent ncurses binutils-unwrapped coreutils findutils ];
in stdenv.mkDerivation {
  pname = "nix-top";
  version = "0.3.0";

  src = ./.;

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [ ruby ];

  installPhase = ''
    mkdir -p $out/libexec/nix-top
    install -D -m755 ./nix-top $out/bin/nix-top
    wrapProgram $out/bin/nix-top \
      --prefix PATH : "$out/libexec/nix-top:${additionalPath}"
  '' + lib.optionalString stdenv.isDarwin ''
    ln -s /bin/stty $out/libexec/nix-top
  '';

  meta = with lib; {
    description = "Tracks what nix is building";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin ++ platforms.freebsd;
    mainProgram = "nix-top";
  };
}
