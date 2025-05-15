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
    rev = "e40096eb07e0d683f61f5ac9d5bbc9d36527c524";
    hash = "sha256-UfYFylItjPp+Vmfh/aWVTWBPN/GvrnDv/9u6bqDKXOU=";
  };

  useFetchCargoVendor = true;
  # cargoHash = "";
  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite ];
}
