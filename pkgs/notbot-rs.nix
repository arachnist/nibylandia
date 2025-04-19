{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, luajit_2_1, ... }:

let version = "0.3.0";
in rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-FfdtdPyQtpMNOYxJmLB/ngUuK/R6wSle4TcnQihgDxI=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-khixxFgPibRVfHeTLgRNHKqbM7v7wkROQ51l+qVOxys=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite luajit_2_1 ];
}
