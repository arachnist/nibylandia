{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, ... }:

rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  version = "0.0.1";

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    rev = "4080c9ddeada946e420b3330c5eac399aa3b5044";
    hash = "sha256-XowK5kOycAc0Gf1LPwiacFhTiXATwEtBD9W3XWnvizY=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-6pAkeWfwPz9sF2sKI/1sh6WttqtDTODxxd1oU67CFic=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];
}
