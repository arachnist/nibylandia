{
  hosts = builtins.mapAttrs (name: value:
    builtins.fromJSON (builtins.readFile (./nixos/. + "/${name}/meta.json")))
    (builtins.readDir ./nixos);
}
