{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "704396e6014b97970516e5f61fe04e8bb28454fa";
    hash = "sha256-c1mfl0QxiKNhcLdT1fktVWzXhqrYDdoynvf2vs/PHbs=";
  };
  inherit patches;
  nativeBuildInputs = [ gawk gnused ];
  postPatch = postPatch
    + lib.optionalString (lib.versionAtLeast yarn-berry.version "4.1.0") ''
      # this is for yarn starting with 4.1.0 because fuck everything amirite
      # see also https://github.com/yarnpkg/berry/pull/6083
      echo "patching cachekey in yarn.lock"
      cacheKey="$(awk -e '/cacheKey:/ {print $2}' yarn.lock)"
      sed -i -Ee 's|^  checksum: ([^/]*)$|  checksum: '$cacheKey'/\1|g;' yarn.lock
    '';
}) // {
  version = "unstable-2024-08-12";
  yarnHash = "sha256-kkjRYQPjWB1udlpIH2Q+a+bbiqXw1T/dgv3KmQk/YBY=";
}
