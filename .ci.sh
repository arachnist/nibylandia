#!/usr/bin/env bash

source /run/agenix/ci-secrets

set -eou pipefail

set -x

while read hostOutput; do
  echo "${hostOutput}"
  nixos-rebuild build --verbose --flake ".#${hostOutput}"
done < <(nix eval -I nixpkgs=$(nix flake metadata nixpkgs --json | jq -r .path) --raw --impure --expr '
    with import <nixpkgs> { };
    (lib.strings.concatStringsSep "\n"
    (lib.mapAttrsToList (n: v: n)
      (lib.attrsets.filterAttrs (n: v: v.pkgs.system == pkgs.system)
        (builtins.getFlake(builtins.toString ./.)).outputs.nixosConfigurations)))
'; echo "")
