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

  orca-slicer = super.orca-slicer.overrideAttrs (old: {
    version = "v2.3.1-git-2025-09-17";

    src = super.fetchFromGitHub {
      owner = "arachnist";
      repo = "OrcaSlicer";
      rev = "23bcae9a65b017135552bd62a20346a32528338f";
      hash = "sha256-yNfSymhc13OfS0PyUw2oFe/WLBOu5PYMnlgS1PKY6Ds=";
    };

    prePatch = old.prePatch + ''
      sed -i 's|"libnoise/noise.h"|"noise/noise.h"|' src/libslic3r/Feature/FuzzySkin/FuzzySkin.cpp
    '';

    patches = (lib.filter (x:
      (builtins.match ".*(no-osmesa|dont-link-opencv-world-orca)[.]patch"
        "${x}") == null) super.orca-slicer.patches)
      ++ [ ../pkgs/orca-slicer-dont-link-opencv-world.patch ];

    postBuild = "( cd .. && ./scripts/run_gettext.sh )";
  });
}
