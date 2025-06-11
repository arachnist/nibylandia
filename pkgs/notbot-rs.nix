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
    rev = "5ad937f13617ae0ce3ef5a7c79737cf9557d3ccc";
    hash = "sha256-CqBFdGqc/q5wZw6D78er7q+fhgfv/WxZKggmBpIs6qc=";
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
