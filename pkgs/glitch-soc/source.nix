{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "90de5574ad9835e3fc3642447068864de0187ba3";
    hash = "sha256-Mj+lj+1LBUbahSgrCHq2waIZ8bY8WhybL3X/t//VK74=";
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
  version = "unstable-2024-08-21";
  yarnHash = "sha256-+cqYLkunBIZaSMvkDx1Lbx8w2JNL2ktgWsN+G4Mj/+s=";
}
