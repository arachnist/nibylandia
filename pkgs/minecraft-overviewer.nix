{ fetchFromGitHub, pipreqs, pillow_with_headers, buildPythonApplication, python3
, altgraph, certifi, charset-normalizer, distutils, docopt, idna
, importlib-metadata, nbtlib, numpy, packaging, pefile, requests, setuptools
, urllib3, yarg, zipp, ... }:

buildPythonApplication {
  pname = "Minecraft-Overviewer";
  version = "2024-12-08";
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
    rev = "bd53129ac47434bc78ca25518a45d927fb1df032";
    sha256 = "sha256-6jcReRuWBVmOp3vCwEV9B5B08/O6MDB1hUFqhSu1V0s=";
  };
}
