self: super:
let inherit (self) lib;
in {
  cass = super.callPackage ../pkgs/cass.nix { };
  notbot = super.callPackage ../pkgs/notbot.nix { };
  nix-top = super.callPackage ../pkgs/nix-top { };
  glitch-soc = let
    emoji-reactions = import ../pkgs/glitch-soc/emoji.nix {
      inherit (super) fetchpatch fetchurl;
    };
    file-post-patch = lib.concatMapStringsSep "\n" (f: ''
      mkdir -p "$(dirname "${f.name}")"
      cp -f "${f.src}" "${f.name}"
    '') emoji-reactions.files;
    tl-replacer = super.callPackage ../pkgs/glitch-soc/tl-replacer { };
  in self.callPackage ../pkgs/glitch-soc {
    srcPostPatch = ''
      ${file-post-patch}
            ${tl-replacer}/tl-replacer ${tl-replacer}/tl-replacer.yaml
    '';
    inherit (emoji-reactions) patches;
  };

  python311ForMCOverviewer = super.python311.override {
    packageOverrides = self: super: {
      pillow_with_headers =
        self.callPackage ../pkgs/pillow-with-headers.nix { };
      numpy = super.numpy.overrideAttrs
        (super: { patches = super.patches ++ [ ../pkgs/numpy-gcc-14.patch ]; });
    };
  };

  py311MCOPackages = self.python311ForMCOverviewer.pkgs;

  minecraft-overviewer =
    self.py311MCOPackages.callPackage ../pkgs/minecraft-overviewer.nix { };
}
