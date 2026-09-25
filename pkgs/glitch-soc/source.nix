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
    rev = "274c0a79b6d63c955348157472ffec759322aab1";
    hash = "sha256-OBbjwlEDmAcIqAr46uDP9ajUUwb0cQcXX1Xtky3WSlk=";
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
  version = "unstable-2026-09-25";
  yarnHash = "sha256-xGupT2Ux4962r8KPdhW4JRM1Bn1NE9tzzHdlvArg+yQ=";
}
