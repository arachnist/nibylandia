{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.1.2";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-D1A09R0Usyi2stE+p838pKDImq5lgAXRtFr3NWoz/zY=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-g2dPdt2WbvFAC9lHSptVc4Iv9I4LJL0a1Y4JBq4tmy8=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
