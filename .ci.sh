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
done < <(nix eval --raw --impure --expr '
let
  hosts = (import ./meta.nix).hosts;
  filterHosts = hosts: (
    builtins.filter (h: !hosts.${h}.ciSkip && hosts.${h}.system == builtins.currentSystem)
      (builtins.attrNames hosts)
  );
in
  builtins.concatStringsSep "\n" (filterHosts hosts)
'; echo ""
)
