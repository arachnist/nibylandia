{ fetchFromGitHub, pipreqs, pillow_with_headers, buildPythonApplication, python3
, altgraph, certifi, charset-normalizer, distutils, docopt, idna
, importlib-metadata, nbtlib, numpy, packaging, pefile, requests, setuptools
, urllib3, yarg, zipp, ... }:

buildPythonApplication {
  pname = "Minecraft-Overviewer";
  version = "2025-10-15";
  format = "other";

  build-system = [ setuptools ];

  dependencies = [
    pipreqs
    pillow_with_headers
    altgraph
    certifi
    charset-normalizer
    distutils
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
  ];

  env.NIX_CFLAGS_COMPILE = "-Wno-int-conversion -I${pillow_with_headers}/include/libImaging";

  installPhase = ''
    python setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  src = fetchFromGitHub {
    owner = "GregoryAM-SP";
    repo = "The-Minecraft-Overviewer";
    rev = "97b26646ccea267ea6a59902cc95a4914054df24";
    hash = "sha256-G6lQNepMOcBto//GME2As/6w2Gdky0TZtUqgcKLCQks=";
  };

  patches = [
    ./minecraft-overviewer.patch
  ];
}
