{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "glitch-soc";
    repo = "mastodon";
    rev = "a8e6f5e656a9f46377b05d288654c1ba86bb858f";
    hash = "sha256-EP+43scB5+cpmL3yM8TLAWSb7PbZQpdhOwewXae+FnI=";
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
  version = "unstable-2024-05-30";
  yarnHash = "sha256-BNk6xMx11QYQQ8occYU1HJ6z/AuF2UeDRzJwgAFb0XQ=";
}
