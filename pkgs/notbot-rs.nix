{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, luajit_2_1, ... }:

let version = "0.4.3";
in rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-ViSBEXqzsiO9fjcpD2oCarrw3up9jVQj+4QG/hdjOQk=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-pCmCkTa/WR17UXDQjMCZpzwTJjMn4SdRSbQKZ6lt5bc=";

  RUSTFLAGS = "--cfg tokio_unstable";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite luajit_2_1 ];
}
