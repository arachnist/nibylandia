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
    rev = "8aebf44d181b87458848e4c192d91dace835b142";
    hash = "sha256-yKQJRg42n/Phei4BNfVe8f2qnhbLCWPA8X3YXOlP/YE=";
  };
  /*/
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "8aebf44d181b87458848e4c192d91dace835b142";
    ref = "riir";
  };*/

  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite fontconfig freetype ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
