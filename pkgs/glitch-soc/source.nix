{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "c9f887f1efd38a99a07920084fae68950b6d448d";
    hash = "sha256-oe0FQKa0CeE/NGvn6uY3YPUtN7MGhzD1jiTz4qCWnw0=";
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
  version = "unstable-2025-08-12";
  yarnHash = "sha256-MZ79042yJ66YWScULuQvWqHYQeRVWVtvNAgrQFS938k=";
}
