{ fetchFromGitea, rustPlatform, pkg-config, openssl, sqlite, fontconfig
, freetype, ... }:

let version = "0.6.13";
in rustPlatform.buildRustPackage rec {
  pname = "notbot-rs";
  inherit version;

  src = fetchFromGitea {
    domain = "code.hackerspace.pl";
    owner = "ar";
    repo = "notbot";
    # tag = "v${version}";
    rev = "ffe9145ce427e653cd482459d449549142270143";
    hash = "sha256-bT9opotcGjA8XnvUPWhRzcjEM690iPxjVa6CmbCKGo4=";
  };
  /* src = builtins.fetchGit {
       url = "file:///home/ar/scm/notbot";
       rev = "2ab3785eb6df1053b3b41195de12c0ed499c1f05";
       ref = "riir";
     };
  */

  useFetchCargoVendor = true;
  # cargoHash = "";
  cargoLock.lockFile = "${src}/Cargo.lock";

  RUSTFLAGS = "--cfg tokio_unstable";

  doCheck = false;
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl sqlite fontconfig freetype ];

  postInstall = ''
    cp -r $src/webui $out/webui
  '';
}
