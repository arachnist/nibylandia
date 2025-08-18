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
    rev = "ab34b153480b9bd1ee97e54fcaa5b0848beb1f6e";
    hash = "sha256-rOsp/ErUih97VKc2OgReC976VFyRDoBiBxMBsQOTZ50=";
  };
  /*/
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "68aae008b9790a46c8e5f1b034bb188d981cbb50";
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
