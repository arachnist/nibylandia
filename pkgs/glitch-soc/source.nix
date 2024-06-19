{ lib, applyPatches, fetchFromGitHub, patches ? [ ], postPatch ? "", yarn-berry
, gawk, gnused, }:
(applyPatches {
  src = fetchFromGitHub {
    owner = "glitch-soc";
    repo = "mastodon";
    rev = "248b494a59a37d539e51556dc2928922868df086";
    hash = "sha256-0OqIvr7XDJPfPyq9hiQj3xwsmFaNEVB1kYOnz3tdi2U=";
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
  version = "unstable-2024-06-19";
  yarnHash = "sha256-T1BQgnQCL/bANXN4tKhZk94u5VVXuW4ySb5tbjqM4OM=";
}
