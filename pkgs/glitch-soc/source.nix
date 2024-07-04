{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "glitch-soc";
    repo = "mastodon";
    rev = "87415f21e49b057f5c20652b458fdf81e5ecc2d7";
    hash = "sha256-+Chyg+jtit5Q4atYNWaQOcVs7ADXovmsWyw3yT99pzU=";
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
  version = "unstable-2024-07-04";
  yarnHash = "sha256-2iud+LfchFMXEv9/qQRTIyVPHJRe1WyljK2KmPMJ4Yg=";
}
