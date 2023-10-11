#!/usr/bin/env bash

set -eou pipefail

export NIX_CONFIG="use-xdg-base-directories = true"

nix profile install nixpkgs#nixos-rebuild

~/.local/state/nix/profile/bin/nixos-rebuild build --flake ".#ciTest"

# for hostOutput in $(nix eval --raw --impure --expr '
#     with import <nixpkgs> { };
#     (lib.mapAttrsToList (name: value: value)
#         (builtins.getFlake(builtins.toString ./.)).outputs.nixosConfigurations)[0]'
# ); do
#     ~/.local/state/nix/profile/bin/nixos-rebuild build --flake ".#${hostOutput}"
# done
# 
