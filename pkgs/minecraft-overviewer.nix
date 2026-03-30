{
  fetchFromGitHub,
  pipreqs,
  pillow,
  buildPythonApplication,
  python3,
  altgraph,
  certifi,
  charset-normalizer,
  distutils,
  docopt,
  idna,
  importlib-metadata,
  nbtlib,
  numpy,
  packaging,
  pefile,
  requests,
  setuptools,
  urllib3,
  yarg,
  zipp,
  ...
}:

buildPythonApplication {
  pname = "Minecraft-Overviewer";
  version = "2025-11-29";
  format = "other";

  build-system = [ setuptools ];

  dependencies = [
    pipreqs
    pillow
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

  env.NIX_CFLAGS_COMPILE = "-Wno-int-conversion -I${pillow}/include/libImaging";

  installPhase = ''
    python setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  src = fetchFromGitHub {
    owner = "GregoryAM-SP";
    repo = "The-Minecraft-Overviewer";
    rev = "f62db09399b3cfe5a6f1894f71adb388747537bb";
    hash = "sha256-K7AKTCS9yPIDhRw2EU2pUtl94pD+o0Yganml1o2P8Xc=";
  };
}
