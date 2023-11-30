let
  ar_khas =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfIRe1nH6vwjQTjqHNnkKAdr1VYqGEeQnqInmf3A6UN ar@khas";
  ar_microlith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6rEwERSm/Fj4KO4SxFIo0BUvi9YNyf8PSL1FteMcMt ar@microlith";
in {
  hosts = builtins.mapAttrs (name: value:
    builtins.fromJSON (builtins.readFile (./nixos/. + "/${name}/meta.json")))
    (builtins.readDir ./nixos);

  users.ar = [ ar_khas ar_microlith ];
}
