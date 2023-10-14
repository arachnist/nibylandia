self: super: {
  cass = super.callPackage ../pkgs/cass.nix { };
  notbot = super.callPackage ../pkgs/notbot.nix { };
  glitchSoc = self.callPackage ../pkgs/glitch-soc { };
  mastodon-update-script = self.callPackage ../pkgs/mastodonUpdate.nix { };

  python3 = super.python3.override {
    packageOverrides = self: super: {
      pillow-with-headers =
        self.callPackage ../pkgs/pillow-with-headers.nix { };
      minecraft-overviewer =
        self.callPackage ../pkgs/minecraft-overviewer.nix { };
    };
  };
  python3Packages = self.python3.pkgs;
}
