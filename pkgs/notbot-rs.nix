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
    domain = "codeberg.org";
    owner = "arachnist";
    repo = "notbot";
    # tag = "v${version}";
    rev = "8293c47ba80d8119ca9dbc15cfaecf24cd9a01a5";
    hash = "sha256-kGidNRGSPxhSSFZ+UqtbTmaOlIuZZoeviaOQnIW9/PU=";
  };
  /*
    src = builtins.fetchGit {
      url = "file:///home/ar/scm/notbot";
      rev = "0d77613cd3f4622da4158b0b075f4f8afdd96c98";
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
