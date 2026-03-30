{
  lib,
  applyPatches,
  fetchFromGitHub,
  patches ? [ ],
  postPatch ? "",
  yarn-berry,
  gawk,
  gnused,
}:
(applyPatches {
  src = fetchFromGitHub {
    owner = "arachnist";
    repo = "mastodon";
    rev = "22cd30f0f828d131532e7c53f9611848ca99bb44";
    hash = "sha256-bQYB4rEr/cZeZBh6+eRpNJqJwfqB2swG2kp4GcVlYqU=";
  };
  inherit patches;
  nativeBuildInputs = [
    gawk
    gnused
  ];
  postPatch =
    postPatch
    + lib.optionalString (lib.versionAtLeast yarn-berry.version "4.1.0") ''
      # this is for yarn starting with 4.1.0 because fuck everything amirite
      # see also https://github.com/yarnpkg/berry/pull/6083
      echo "patching cachekey in yarn.lock"
      cacheKey="$(awk -e '/cacheKey:/ {print $2}' yarn.lock)"
      sed -i -Ee 's|^  checksum: ([^/]*)$|  checksum: '$cacheKey'/\1|g;' yarn.lock
    '';
})
// {
  version = "unstable-2025-11-15";
  yarnHash = "sha256-JRuHVgCR599CC/y+IIddsV+172iPykufk+fnCxi0FHo=";
}
