{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.2.0";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-SYnUvuptqEQ4X3gglqmo7sPzXL3i3fERSVtQY9RSieo=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-wlFd/lkAW/GaKeUrO/JyT7rNzIwgivCQfunz7V1ThCk=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
