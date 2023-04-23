final: prev: {
  fedifetcher = self.callPackage ./pkgs/fedifetcher.nix { };
  glitchSoc = self.callPackage ./pkgs/glitch-soc { };
  mastodon-update-script = self.callPackage ./pkgs/mastodonUpdate.nix { };
}
