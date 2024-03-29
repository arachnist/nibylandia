# This file was generated by pkgs.mastodon.updateScript.
{ fetchFromGitHub, applyPatches, patches ? [ ] }:
let version = "be934df67eea4d7a5b7b6e657f1f2e8ceec5bb63";
in (applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "${version}";
    hash = "sha256-zXBxKC3jf4TaoOlDBgE9FdH9BJ9dwRgvKWLkooq3hPs=";
  };
  patches = patches ++ [ ./local-new-fixes.patch ];
}) // {
  inherit version;
  yarnHash = "sha256-P7KswzsCusyiS4MxUFnC1HYMTQ6fLpIwd97AglCukIk=";
}
