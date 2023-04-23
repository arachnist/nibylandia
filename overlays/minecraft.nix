final: prev: {
  python3 = super.python3.override {
    packageOverrides = self: super: {
      pillow-with-headers = self.callPackage ./pkgs/pillow-with-headers.nix { };
      minecraft-overviewer =
        self.callPackage ./pkgs/minecraft-overviewer.nix { };
    };
  };
}
