{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.2.3";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-6WBECKWfCPwDfCtZkuS9GABtoft1VwbKo5qZUN7NOsQ=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-QXIXOwtI+OOK80WxxJteztKoLnlYOuyfjV6u/nefnZI=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
