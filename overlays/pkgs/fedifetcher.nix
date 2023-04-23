{ fetchFromGitHub, python3 }:

python3.pkgs.buildPythonApplication rec {
  pname = "fedifetcher";
  version = "4.1.6";

  #  src = fetchFromGitHub {
  #    owner = "nanos";
  #    repo = "FediFetcher";
  #    rev = "refs/tags/v${version}";
  #    hash = "sha256-pZQfUWSDltXqnoX/LApFxOz01Z+rjB24EToC2x6KFl4=";
  #  };

  src = ../../FediFetcher;

  format = "other";

  propagatedBuildInputs = with python3.pkgs; [
    certifi
    charset-normalizer
    docutils
    idna
    requests
    six
    urllib3
    python-dateutil
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    chmod +x find_posts.py
    mv find_posts.py $out/bin/find_posts

    runHook postInstall
  '';
}
