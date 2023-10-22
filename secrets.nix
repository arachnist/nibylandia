let
  ar_khas =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfIRe1nH6vwjQTjqHNnkKAdr1VYqGEeQnqInmf3A6UN ar@khas";
  ar_microlith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6rEwERSm/Fj4KO4SxFIo0BUvi9YNyf8PSL1FteMcMt ar@microlith";
  ar = [ ar_khas ar_microlith ];

  scylla =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1X7EaPNfLhWH32IAyaZj2dhJz+QLnyGuXPCZUYRTjg";
  khas =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6VxPqJHYKmVB5d7bd6vuRqBNKXV1fo2R/WvdSF77xa";
  zorigami =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM/7CsIWlJH2F0VQpgsGgZOQeAd7Zh98WpCvmTyXCTty";
  stereolith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVuDOcKE8ANKGjd6kfFH1qLLzLwg91o0exJ0isIEw4O";
  microlith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDghNuH/3G+0BXwrBZWZXX0V3K0tfu/Q/AKokLXY5zTD";
in {

  "secrets/secureboot-key.age".publicKeys = ar
    ++ [ khas microlith zorigami scylla ];
  "secrets/secureboot-cert.age".publicKeys = ar
    ++ [ khas microlith zorigami scylla ];
  "secrets/khas-ar.age".publicKeys = ar ++ [ khas ];
  "secrets/microlith-ar.age".publicKeys = ar ++ [ microlith ];
  "secrets/nix-store.age".publicKeys = ar
    ++ [ zorigami scylla stereolith khas microlith ];
  "secrets/wg/nibylandia_scylla.age".publicKeys = ar ++ [ scylla ];
  "secrets/wg/dn42_w1kl4s_scylla.age".publicKeys = ar ++ [ scylla ];
  "secrets/lan/nibylandia-ddns-kea.age".publicKeys = ar ++ [ scylla ];
  "secrets/lan/nibylandia-ddns-bind.age".publicKeys = ar ++ [ scylla ];
  "secrets/notbotEnvironment.age".publicKeys = ar ++ [ zorigami ];
  "secrets/nextCloudAdmin.age".publicKeys = ar ++ [ zorigami ];
  "secrets/nextCloudExporter.age".publicKeys = ar ++ [ zorigami ];
  "secrets/norkclubMinecraftRestic.age".publicKeys = ar ++ [ zorigami ];
  "secrets/cassAuth.age".publicKeys = ar ++ [ zorigami ];
  "secrets/miniflux.age".publicKeys = ar ++ [ zorigami ];
  "secrets/stuffAuth.age".publicKeys = ar ++ [ stereolith ];
  "secrets/wg/nibylandia_zorigami.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/ar.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/apo.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/amie.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/mastodon.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/mastodonPlain.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/madargon.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/enki.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/matrix.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/vaultwarden.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/vaultwardenPlain.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/keycloak.age".publicKeys = ar ++ [ zorigami ];
  "secrets/mail/keycloakPlain.age".publicKeys = ar ++ [ zorigami ];
  "secrets/keycloakDatabase.age".publicKeys = ar ++ [ zorigami ];
  "secrets/synapseExtraConfig.age".publicKeys = ar ++ [ zorigami ];
  "secrets/gitea-runner-token-zorigami.age".publicKeys = ar ++ [ zorigami ];
  "secrets/gitea-runner-token-scylla.age".publicKeys = ar ++ [ scylla ];
  "secrets/hswaw-wifi.age".publicKeys = ar ++ []; # TODO: we're not getting ssh keys for the generated disk image…

  inherit ar;
}
