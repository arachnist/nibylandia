self: super:
let
  inherit (self) lib;
  emptyDir = self.emptyDirectory;
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

  python311 = super.python311.override {
    packageOverrides = self: super: {
      pillow_with_headers =
        self.callPackage ../pkgs/pillow-with-headers.nix { };
      minecraft-overviewer =
        self.callPackage ../pkgs/minecraft-overviewer.nix { };
    };
  };
  python311Packages = self.python311.pkgs;

  python312 = super.python312.override {
    packageOverrides = self: super: { pysaml2 = self.toPythonModule emptyDir; };
  };
  matrix-synapse-unwrapped = super.matrix-synapse-unwrapped.overrideAttrs
    (old: {
      postPatch = (old.postPatch or "") + ''
        substituteInPlace tests/storage/databases/main/test_events_worker.py --replace-fail \
        $'    def test_recovery(' \
        $'    from tests.unittest import skip_unless\n'\
        $'    @skip_unless(False, "broken")\n'\
        $'    def test_recovery('
      '';
    });
}
