{ fetchFromGitHub, pipreqs, pillow_with_headers, buildPythonApplication, python3
, altgraph, certifi, charset-normalizer, distutils, docopt, idna
, importlib-metadata, nbtlib, numpy, packaging, pefile, requests, setuptools
, urllib3, yarg, zipp, ... }:

buildPythonApplication {
  pname = "Minecraft-Overviewer";
  version = "2025-03-28";
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

  env.NIX_CFLAGS_COMPILE = "-I${pillow_with_headers}/include/libImaging";

  installPhase = ''
    python setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  src = fetchFromGitHub {
    owner = "GregoryAM-SP";
    repo = "The-Minecraft-Overviewer";
    rev = "fed92af78752f0cfde9e94abf53ffb56ffba5435";
    sha256 = "sha256-RGjOW4+aJF0L+mUU7Mg0ZhN+PfzZZSS2pZ4hXkuqQU8=";
  };

  patches = [
    ./minecraft-overviewer.patch
  ];
}
