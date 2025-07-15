{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "adc9de70f8b47ab5bb2e57bb374242cecd685095";
    hash = "sha256-oQHKBqz4ATqO1KV7k/N8BfWFrm/X9VN7twZk5wpEfvU=";
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
  version = "unstable-2025-07-15";
  yarnHash = "sha256-USoGq7bC3zlOIcz/zKJKkW+kGE/3vb2l5HIt6ZWoyVA=";
}
