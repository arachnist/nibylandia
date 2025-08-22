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
    rev = "0305e17ea9355617681ff363536041b0c9a32c24";
    hash = "sha256-mSib76RZr1Opo2FCByly7duMVpPs4QuC4ctzN7VRvQ8=";
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
