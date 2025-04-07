{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

let
  version = "0.1.4";
in
rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-NQjHUPrd255VdMEaqzwMKji85603cWw2nir61VZUsdI=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-vSCh3ngwxe2u7Ihpofy2rl8yG37VrWqAcGfg44tf/wc=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
