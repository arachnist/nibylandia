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
    rev = "5420439a0f869c021008943ccc5adba446ade65e";
    hash = "sha256-GGk8rurj4shW8gns84QxUUUq5AQa23rdU3nFdTYn554=";
  };
  /*/
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "ba2de982d4cdf9438e13a7d16446a6dfc081835e";
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
