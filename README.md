# My personal NixOS infrastructure configurations

This repository contains configurations for Most™ of my NixOS machines.

All of the host configurations are deployable using
[deploy-rs](https://github.com/serokell/deploy-rs),
[colmena](https://colmena.cli.rs/), and plain old `nixos-rebuild`. See
`deploy.nodes` and `colmena` crimes in flake outputs for details how. Initial
host deploment, sadly, needs to happen manually (for now at least). Secrets are
managed using [agenix](https://github.com/ryantm/agenix), instead of any
deployment-tool-native secret manager.

## General usage
### Adding new module
```
$ echo -e "{ config, lib, pkgs, inputs, ... }:\n\n{\n}" > modules/new-module.nix
```

### Adding new host
```
$ mkdir nixos/newhost
$ echo -e "{ config, lib, pkgs, inputs, ... }:\n\n{\n}" > nixos/newhost/default.nix
$ echo '{"publicKey": "…", "targetHost": "…", "system": "aarch64-linux"}' | jq -rM > nixos/newhost/meta.json
```

### Exploring generated configurations
Colmena has a nice feature here called `colmena repl`. Go out there and explore
`nodes` and its attributes.

### Before you commit
To keep things clean, uniform, and working at least on some basic level,
remember to:
```
$ nix flake check --no-build
$ nix fmt
```
Small bit of warning: `nix fmt`, with formatters as configured (`deadnix`
specifically) *will* remove unused variables and such. Might be annoying when
things are work-in-progress.

### Deploying new configurations
There are multiple options here. You can use `nixos-rebuild` either locally:
```
$ sudo nixos-rebuild switch --flake .#microlith
```
remotely:
```
$ nixos-rebuild switch --target-host root@zorigami --build-host root@zorigami --flake .#zorigami
```
remotely using `deploy-rs`:
```
$ deploy .#scylla
```
or using `colmena`:
```
$ colmena apply --on khas
```
All of these *should* generally work, though I prefer to use `deploy-rs` on my
router (because of magic rollback) when deploying bigger changes, and `colmena`
in most cases, because it's faster. And if the changes you're about to deploy
had a chance to be built by "CI", most stuff shouldn't need to be built locally.

Warnings about `colmena` and `deploy` being unknown flake outputs are known, and
will stay here at least until
[schemas](https://determinate.systems/posts/flake-schemas) get implemented for
these.

## General notes
Feel free to use this as a basis for your own configuration flakes, but while I
keep things here working for me, the general state might not reflect best
practices. Use caution, and if you feel like you don't really understand
something (and there are some code crimes commited here), don't feel obliged to
use it just because it's already here.
