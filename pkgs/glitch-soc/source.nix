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
    rev = "9cd04b95f081e8bd7610e408d05ee74a56ebfeae";
    hash = "sha256-ArlOa6FtpA8oSwHGBjvoueHdUEeo46PpnlvqyZh3kjE=";
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
  version = "unstable-2026-05-20";
  yarnHash = "sha256-GjI0Ltx38MCP19tQjjTrNLuQ0p2cUQ/eKBjpmivEtW4=";
}
