{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, fontconfig, freetype, ... }:

let version = "0.6.12";
in rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "45a328d2403cbf78ac82115aa66062a2d6341982";
    hash = "sha256-DRa6mH9ONLw1EtOAtozEqizo4fR7ggLs9C+7c5Ats6w=";
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
