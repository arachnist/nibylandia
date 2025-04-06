{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.1.3";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-rRyhyG2UMHiNSewr7DJQPG+jsS3CioF3zxAiwRB4Lg0=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-8yzEN8kiTCo3m8SppX7dmEiSwq3y7PlErwHjPyn9WLQ=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
