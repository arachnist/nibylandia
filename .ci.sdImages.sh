#!/usr/bin/env bash

source /run/agenix/ci-secrets

set -eou pipefail

set -x

while read hostOutput; do
  echo "${hostOutput}"
  nix build --no-link ".#nixosConfigurations.${hostOutput}.config.system.build.sdImage"
done < <(nix eval -I nixpkgs=$(nix flake metadata nixpkgs --json | jq -r .path) --raw --impure --expr '
    with import <nixpkgs> { };
    (lib.strings.concatStringsSep "\n"
    (lib.mapAttrsToList (n: v: n)
      (lib.attrsets.filterAttrs (n: v: v.pkgs.system == pkgs.system && v.pkgs.system == "aarch64-linux" && n != builtins.getEnv "HOSTNAME")
        (builtins.getFlake(builtins.toString ./.)).outputs.nixosConfigurations)))
')
