{
  lib,
  writeShellApplication,
  curl,
  jq,
  nix-prefetch,
  fetchpatch,
  fetchpatch2,
  fetchurl,
  applyPatches,
}:
# this is a really cursed thing but honestly it works surprisingly well
writeShellApplication {
  name = "nix-from-pr";
  text = builtins.readFile ./script.sh;
  runtimeInputs = [curl jq nix-prefetch];
  derivationArgs.passthru = rec {
    getPatches = prDataFile: let
      prData = lib.callPackageWith {inherit fetchpatch fetchpatch2 fetchurl;} prDataFile {};
      patches = prData.patches;
      prePatch =
        lib.concatMapStringsSep "\n" (f: ''
          mkdir -p "$(dirname "${f.name}")"
          cp -f "${f.src}" "${f.name}"
          chmod +w "${f.name}"
        '')
        prData.files;
    in {
      inherit patches prePatch;
    };
    apply = {
      prDataFile,
      src,
    }: let
      data = getPatches prDataFile;
    in
      applyPatches {
        inherit src;
        inherit (data) patches prePatch;
      };
  };
}
