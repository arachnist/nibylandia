final: prev: {
  mpv-unwrapped = prev.mpv-unwrapped.override { sixelSupport = true; };
  cass = prev.callPackage ./pkgs/cass.nix { };
  notbot = prev.callPackage ./pkgs/notbot.nix { };
}
