{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, luajit_2_1, ... }:

let version = "0.4.1";
in rustPlatform.buildRustPackage {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    tag = "v${version}";
    hash = "sha256-9TjEStTWBfKbH0oYqJSrV5VuGhNlSV1xc6Hk6K+ffNM=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-cY8e7K/HXnnGPFd7RNFB2XPRdWehpc3uTJb3DvYeebQ=";

  RUSTFLAGS = "--cfg tokio_unstable";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite luajit_2_1 ];
}
