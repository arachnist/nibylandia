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
    rev = "a53eb35819d0ad28f8df4c99d3d8cd08b5f0b7b1";
    hash = "sha256-1IHvQR9N7I2ZiXYbBwPMglDOm0jOwmLzTvllQHrdh9U=";
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
