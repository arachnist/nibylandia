self: super:
let inherit (self) lib;
in {
  cass = super.callPackage ../pkgs/cass.nix { };
  notbot = super.callPackage ../pkgs/notbot.nix { };
  notbot-rs = super.callPackage ../pkgs/notbot-rs.nix { };
  nix-top = super.callPackage ../pkgs/nix-top { };
  glitch-soc = let
    emoji-reactions = import ../pkgs/glitch-soc/emoji.nix {
      inherit (super) fetchpatch2 fetchurl;
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
  nix-from-pr = super.callPackage ../pkgs/nix-from-pr { };

  python311MCOverviewer = super.python311.override {
    packageOverrides = pyself: pysuper: {
      pillow_with_headers =
        pyself.callPackage ../pkgs/pillow-with-headers.nix { };
    };
  };

  py311MCOPackages = self.python311MCOverviewer.pkgs;

  minecraft-overviewer =
    self.py311MCOPackages.callPackage ../pkgs/minecraft-overviewer.nix {
      python3 = self.python311MCOverviewer;
    };

  orca-slicer = let
    sovol-profiles = super.fetchzip {
      url =
        "https://github.com/Sovol3d/Sovol-OrcaSlicer/releases/download/v2.3.0.4/Sovo.Profilesl.zip";
      hash = "sha256-CvcM3Cst35Bz2lloejkKsSla1qrHHuDMxU67da5eHVs=";
    };
  in super.orca-slicer.overrideAttrs (old: {
    prePatch = old.prePatch + ''
      rm -rf resources/profiles/Sovol resources/profiles/Sovol.json
      cp --target-directory=resources/profiles -r ${sovol-profiles}/*
    '';
  });
}
