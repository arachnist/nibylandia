{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let version = "0.6.12";
in rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "7a7b848855f5abc4ee321b150e8530154d4bcc00";
    hash = "sha256-cUyd19f6Afg1Iosn+iOEhGohzOnQTb/Lg6py/q9P9Ok=";
  };

  useFetchCargoVendor = true;
  # cargoHash = "";
  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
