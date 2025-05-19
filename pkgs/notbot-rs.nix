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
    rev = "614f5ac29963e507acf3d2d0d78b892a124e9e24";
    hash = "sha256-urTB3d13s+AzqS8p0jCUs3+Asm5tOxjs2kJRMmXuFBE=";
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
