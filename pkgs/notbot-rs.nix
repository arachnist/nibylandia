{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, luajit_2_1, ... }:

let version = "0.4.0";
in rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-BfHkeZ1TqQFWyeSfQzZoLsYxuGCYhiiK1hgucHN8h3g=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-BdKMIGsXdolsf9Ku95Ujow0S2MriqGvJjBncaZDCeiw=";

  RUSTFLAGS = "--cfg tokio_unstable";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite luajit_2_1 ];
}
