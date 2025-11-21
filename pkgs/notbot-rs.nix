{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, fontconfig
, freetype, ... }:

let version = "0.6.13";
in rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "e36bfcf6db7a1d101072eca4c807cfaf0227cb61";
    hash = "sha256-EAG/jR9Uk2JNOUZ/1oE/FdfxLYLZeF6n6X+i3NpFY0Q=";
  };
  /*/
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot-async";
    rev = "847e2122d955f2207fab7f7fec9f28e2b191175f";
    ref = "riir";
  };
  */

  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite fontconfig freetype ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
