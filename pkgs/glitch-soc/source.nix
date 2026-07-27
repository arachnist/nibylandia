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
    rev = "59e342e27f662973e49bcb283b975950fbdd81a9";
    hash = "sha256-Ebf5q+3INsUaS20H0xZh4O/vwt+85YgC2wkWfrNSl/E=";
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
  version = "unstable-2026-07-27";
  yarnHash = "sha256-K4TCh9aFqPnGUH/MtxxtMaMtAYWutveUlqDafziHHlo=";
}
