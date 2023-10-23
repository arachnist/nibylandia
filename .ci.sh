#!/usr/bin/env bash

set -a
source /run/agenix/ci-secrets
set +a

cat ci-secrets.nix | envsubst > ci-secrets.nix.tmp
mv ci-secrets.nix.tmp ci-secrets.nix

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
