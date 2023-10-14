{ fetchFromGitea, buildGoModule, ... }:

buildGoModule rec {
  pname = "notbot";
  version = "0.0.3";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "arachnist";
    repo = pname;
    rev = "195b12bdba2d579533e00de9c9dce52ece0bc562";
    sha256 = "cHy1TSUI2KfZyaZMXJibT4G/HwcBhPKQF6ftJpilRCQ=";
  };

  vendorSha256 = "sha256-gi6mrJW65tfWYScwRlPSvBartqfvVlGbR9GWfj9G4xE=";
  proxyVendor = true;
}
