{
  callPackage,
  patches ? [ ],
  srcPostPatch ? "",
  yarn-berry_4_18,
  mastodon,
}:
let
  src = callPackage ./source.nix {
    inherit patches;
    postPatch = srcPostPatch;
  };

  # the upstream nix package doesn't support yarn berry yet so here we fucking go
  # see https://github.com/NixOS/nixpkgs/issues/254369 and https://github.com/NixOS/nixpkgs/issues/277697
  yarn-deps = callPackage ./yarn.nix {
    inherit src;
    hash = src.yarnHash;
    yarn-berry = yarn-berry_4_18;
  };

  # this is mastodon built from the glitch source
  # modules are unpatched though
  glitch-1 = mastodon.override {
    pname = "glitch";
    yarn-berry_4 = yarn-berry_4_18;
    srcOverride = src;
    gemset = ./. + "/gemset.nix";
  };

  modules = callPackage ./modules.nix {
    inherit glitch-1 yarn-deps;
    yarn-berry = yarn-berry_4_18;
  };

  glitch-2 = glitch-1.overrideAttrs (old: {
    mastodonModules = modules;
  });
in
glitch-2
