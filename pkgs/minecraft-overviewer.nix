{ fetchFromGitHub, buildPythonPackage, python3Packages, python3, ... }:

buildPythonPackage rec {
  pname = "Minecraft-Overviewer";
  version = "2021-12-14";
  format = "other";

  propagatedBuildInputs = with python3Packages; [
    pillow-with-headers
    numpy
    networkx
  ];

  buildInputs = with python3Packages; [ setuptools ];

  buildPhase = ''
    export CFLAGS="-I${python3Packages.pillow-with-headers}/include/libImaging"
    ${python3.interpreter} setup.py build
  '';

  installPhase = ''
    ${python3.interpreter} setup.py install --prefix=$out --install-lib=$out/${python3.sitePackages}
  '';

  src = fetchFromGitHub {
    owner = "overviewer";
    repo = pname;
    rev = "7171af587399fee9140eb83fb9b066acd251f57a";
    sha256 = "sha256-iJv4mL1Zr6clL5iuUg1kHoIk9Kk3R4TOYsrldEVyfVo=";
  };
}
