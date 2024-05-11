{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "glitch-soc";
    repo = "mastodon";
    rev = "7c81666f7f8d7c0321d12899680f6e0b5bf3757a";
    hash = "sha256-myxCbzi6mDwSzlRULW2695ggPUGOEAn6K2PWQ/tuov4=";
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
  version = "unstable-2024-05-14";
  yarnHash = "sha256-tw5EiPWNpzGjjLkTx++W82bA5ZZiJCzU1BELgXU+d1M=";
}
