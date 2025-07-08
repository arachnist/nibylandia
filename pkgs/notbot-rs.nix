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
    rev = "dbb5c86376845a8b319ae684ec232ec67f8c3a1a";
    hash = "sha256-HClZXghyxWK09+TEvGxjgyqhrwAQb5YgQrj2EX3YXFg=";
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
