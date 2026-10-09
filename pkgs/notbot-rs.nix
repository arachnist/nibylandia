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
    rev = "3bc52022fba17b1e1b79877592a7c27659d8a194";
    hash = "sha256-i6mS3J+vKPoAtXar8bNy+oqbcqlgBu0aX+T0re0uY2s=";
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
