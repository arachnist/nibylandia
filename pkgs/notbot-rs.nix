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
    rev = "895bed0dc9031b7f5f7907151159f1cbdfa12ce2";
    hash = "sha256-Rd2eIRAaT6dFqAysfLar6x00l068WZkRJwyONJzvNoE=";
  };
  /* src = builtins.fetchGit {
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
