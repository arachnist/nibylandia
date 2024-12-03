{ fetchFromGitea, buildGoModule, ... }:

let pname = "cass";
in buildGoModule {
  inherit pname;
  version = "0.0.1";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "arachnist";
    repo = pname;
    rev = "00b3536c5b546bb5b929b2562c86fee2869885a4";
    sha256 = "+ZGO/ZoGN+LdcPGWHjjZ/wpayFxnfKvxiVMaS0iNYr0=";
  };

  vendorHash = null;
}
