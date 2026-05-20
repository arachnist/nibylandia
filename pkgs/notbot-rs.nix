{
  fetchFromGitea,
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  fontconfig,
  freetype,
  ...
}:

let
  version = "0.6.13";
in
rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "98f2c25a8ead10e431bcaad658f29e4492124f21";
    hash = "sha256-k3n8gCA5/w6PR0cGGVECDBALfEjFyx8bBWMkRowZ3Z8=";
  };
  /*
  src = builtins.fetchGit {
    url = "file:///home/ar/scm/notbot";
    rev = "98f2c25a8ead10e431bcaad658f29e4492124f21";
    ref = "riir";
  };
  */

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
    outputHashes."serde_nested_with-0.2.5" = "sha256-ld9aZdSY3gINiujlwcG35Cc8Ga8DdRduS2XQN9soKn0=";
  };

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    openssl
    sqlite
    fontconfig
    freetype
  ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
