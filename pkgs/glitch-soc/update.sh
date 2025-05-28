#!/usr/bin/env nix-shell
#! nix-shell -i bash -p curl jq coreutils nix-prefetch-github gnused bundix yarn-berry.passthru.yarn-berry-fetcher 'callPackage ../nix-from-pr { }'

set -e

cd "$(dirname "$0")"

commit="$(curl -SsL "${1:-https://api.github.com/repos/arachnist/mastodon/branches/meow-mfm}")"
rev="$(jq -r '.commit.sha' <<<"$commit")"
date="$(jq -r '.commit.commit.committer.date' <<<"$commit")"
date="$(date --date="$date" --iso-8601=date)"
echo "current commit is $rev, prefetching..."

hash="$(nix-prefetch-github arachnist mastodon --rev "$rev" | jq -r '.hash')"

sed -i -Ee "s|^( *rev = )\".*\";|\\1\"$rev\";|g;" ./source.nix
sed -i -Ee "s|^( *hash = )\".*\";|\\1\"$hash\";|g;" ./source.nix
sed -i -Ee "s|^( *version = )\".*\";|\\1\"unstable-$date\";|g;" ./source.nix

nix-from-pr -o emoji.nix glitch-soc/mastodon 2462

echo "building source"
# do this to make sure all patches are applied before generating the gemset
srcdir="$(nix-build --no-out-link -E 'let pkgs = import <nixpkgs> {}; overlay = import ../../overlays/nibylandia.nix; in (overlay pkgs pkgs).glitch-soc.src')"

echo "creating gemset"
rm -f gemset.nix
bundix --lockfile $srcdir/Gemfile.lock --gemfile $srcdir/Gemfile

echo "creating yarn hash"
yarn-berry-fetcher missing-hashes $srcdir/yarn.lock 2>/dev/null > ./missing-hashes.json
hash="$(yarn-berry-fetcher prefetch $srcdir/yarn.lock ./missing-hashes.json 2>/dev/null)"
sed -i -Ee "s|^( *yarnHash = )\".*\";|\\1\"$hash\";|g;" ./source.nix
