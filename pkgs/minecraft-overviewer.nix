{ fetchFromGitHub, pkgs, buildPythonPackage, python3Packages, python3, ... }:

buildPythonPackage rec {
  pname = "Minecraft-Overviewer";
  version = "2024-03-15";
  format = "other";

  propagatedBuildInputs = with pkgs; [
      pipreqs
    ] ++ (with python3Packages; [
    pillow_with_headers
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
    export CFLAGS="-I${python3Packages.pillow_with_headers}/include/libImaging"
    ${python3.interpreter} setup.py build
  '';

  installPhase = ''
    ${python3.interpreter} setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  src = fetchFromGitHub {
    owner = "GregoryAM-SP";
    repo = "The-Minecraft-Overviewer";
    rev = "4deb15d2cfbaaff7327a39b1e24d03eb4f7878ec";
    sha256 = "sha256-8YCZ7pk0Rj7wAT5DqGZmNsSI5qQWx5By+1G73yUsAQw=";
  };
}
