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
    rev = "7c2dfe1ca94fa99eb67b414cef374a095d84c40f";
    hash = "sha256-rEm+ojJbUPNezUex6oSHnLsYhCK+AFxURaqfsHJBlUo=";
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
