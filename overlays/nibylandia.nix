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
      numpy = pysuper.numpy_1;
      pillow_with_headers = pysuper.pillow.overrideAttrs (oa: rec {
        version = "10.3.0";
        src = super.fetchFromGitHub {
          owner = "python-pillow";
          repo = "pillow";
          tag = version;
          hash = "sha256-CfnIdutrayXqAeMpmruDkshlbfF+pSGb3IjaA1vUnKU=";
        };
        preConfigure = let
          getLibAndInclude = pkg:
            ''"${pkg.out}/lib", "${lib.getDev pkg}/include"'';
        in with super; ''
          # The build process fails to find the pkg-config files for these dependencies
          substituteInPlace setup.py \
            --replace-fail 'IMAGEQUANT_ROOT = None' 'IMAGEQUANT_ROOT = ${
              getLibAndInclude libimagequant
            }' \
            --replace-fail 'JPEG2K_ROOT = None' 'JPEG2K_ROOT = ${
              getLibAndInclude openjpeg
            }'

          # Build with X11 support
          export LDFLAGS="$LDFLAGS -L${libxcb}/lib"
          export CFLAGS="$CFLAGS -I${libxcb.dev}/include"
        '';

        postInstall = (oa.postInstall or "") + ''
          mkdir -p $out/include/libImaging
          cp src/libImaging/*.h $out/include/libImaging
        '';
      });
    };
  };

  py311MCOPackages = self.python311MCOverviewer.pkgs;

  minecraft-overviewer =
    self.py311MCOPackages.callPackage ../pkgs/minecraft-overviewer.nix {
      python3 = self.python311MCOverviewer;
      pillow = self.python311MCOverviewer.pkgs.pillow_with_headers;
    };

  okular_no_perms = super.kdePackages.okular.override {
    poppler = super.kdePackages.poppler.overrideAttrs (old: {
      patches = [ ../pkgs/poppler-neuter-permissions.diff ]
        ++ (old.patches or [ ]);
      doCheck = false;
    });
  };

  sound-theme-undertunes =
    super.callPackage ../pkgs/sound-theme-undertunes.nix { };
}
