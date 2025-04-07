{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.1.5";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-arUCHcu1Vk9S2AwfdcADRb+80I0Qt4wYoOBv0vo1RYQ=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-9QDvLMUASm9Vq1w+nBXOHPQa/4k815pm06ru3QHvqVk=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
