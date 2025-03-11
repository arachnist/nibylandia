let
  ar_khas =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfIRe1nH6vwjQTjqHNnkKAdr1VYqGEeQnqInmf3A6UN ar@khas";
  ar_microlith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6rEwERSm/Fj4KO4SxFIo0BUvi9YNyf8PSL1FteMcMt ar@microlith";
  ar_kyorinrin =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8Gk/5iqVco5VQLrAJ2Xd7LvgOmr4f5DpQtQHj1DFqi ar@kyorinrin";
  mae =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBO4040oKfM5kCwzcPhQPFORJ2h+fipz5hnDx7vAMU/Z mae@toothbrush";
  defaultDomain = "tail412c1.ts.net";
in {
  hosts = builtins.mapAttrs (name: value:
    {
      targetHost = name + "." + defaultDomain;
      ciSkip = false;
    }
    // builtins.fromJSON (builtins.readFile (./nixos/. + "/${name}/meta.json")))
    (builtins.readDir ./nixos);

  users.ar = [ ar_khas ar_microlith ar_kyorinrin ];
}
