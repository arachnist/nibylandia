{ callPackage, fetchFromGitHub, pkgs, buildPythonPackage, python311, pythonOlder, ... }:

let
  python3 = python311;
  python3Packages = pkgs.python311Packages;
  pillow_with_headers = callPackage ./pillow-with-headers.nix {
    inherit python3Packages;
  };
in
buildPythonPackage {
  pname = "Minecraft-Overviewer";
  version = "2024-03-15";
  format = "other";

  propagatedBuildInputs = [
    (pkgs.pipreqs.override { inherit python3; })
    pillow_with_headers
  ] ++ (with python3Packages; [
    altgraph
    certifi
    charset-normalizer
    docopt
    idna
    importlib-metadata
    nbtlib
    numpy
    packaging
    pefile
    requests
    urllib3
    yarg
    zipp
  ]);

  buildInputs = with python3Packages; [ setuptools ];

  buildPhase = ''
    export CFLAGS="-I${pillow_with_headers}/include/libImaging"
    ${python3.interpreter} setup.py build
  '';

  installPhase = ''
    ${python3.interpreter} setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  doCheck = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "GregoryAM-SP";
    repo = "The-Minecraft-Overviewer";
    rev = "4deb15d2cfbaaff7327a39b1e24d03eb4f7878ec";
    sha256 = "sha256-8YCZ7pk0Rj7wAT5DqGZmNsSI5qQWx5By+1G73yUsAQw=";
  };
}
