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
    rev = "f3810c43a980a7e53dba9cb6b48ab18404d0cf58";
    hash = "sha256-g4qbnT5J0iToW40DHdFMS3yKmbAsC7Qhrm77a9zR7gI=";
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
