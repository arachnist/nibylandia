{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, fontconfig, freetype, ... }:

let version = "0.6.13";
in rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "b839033f8eb7d38a319b7af3b566189ef51a7233";
    hash = "sha256-30866LdoAIQ0Y1yxVeQAu9BbYs4cClDpXvTuGFT4T2Y=";
  };
  /*
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "2ab3785eb6df1053b3b41195de12c0ed499c1f05";
    ref = "riir";
  };
  */

  useFetchCargoVendor = true;
  # cargoHash = "";
  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite fontconfig freetype ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
