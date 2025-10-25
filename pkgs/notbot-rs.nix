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
    rev = "662eaa4879cd53cc8e1936b7910d5159a3dbe424";
    hash = "sha256-e3GP9PARgz2MSyGRwYFhgfJT1J1K5S6Dyk3ggAaIfVw=";
  };
  /*/
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "70fcddb1ec9e4562d3b9d8b7642ca7862e3d93b7";
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
