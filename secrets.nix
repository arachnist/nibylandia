let
  ar_khas =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfIRe1nH6vwjQTjqHNnkKAdr1VYqGEeQnqInmf3A6UN ar@khas";
  ar_microlith =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6rEwERSm/Fj4KO4SxFIo0BUvi9YNyf8PSL1FteMcMt ar@microlith";
  ar = [ ar_khas ar_microlith ];

  inherit (import ./meta.nix) hosts;
in {

  "secrets/secureboot-key.age".publicKeys = ar ++ (with hosts; [
    khas.publicKey
    microlith.publicKey
    zorigami.publicKey
    scylla.publicKey
  ]);
  "secrets/secureboot-cert.age".publicKeys = ar ++ (with hosts; [
    khas.publicKey
    microlith.publicKey
    zorigami.publicKey
    scylla.publicKey
  ]);
  "secrets/khas-ar.age".publicKeys = ar ++ [ hosts.khas.publicKey ];
  "secrets/microlith-ar.age".publicKeys = ar ++ [ hosts.microlith.publicKey ];
  "secrets/nix-store.age".publicKeys = ar ++ (with hosts; [
    zorigami.publicKey
    scylla.publicKey
    stereolith.publicKey
    khas.publicKey
    microlith.publicKey
    akamanto.publicKey
  ]);
  "secrets/wg/nibylandia_scylla.age".publicKeys = ar
    ++ [ hosts.scylla.publicKey ];
  "secrets/wg/dn42_w1kl4s_scylla.age".publicKeys = ar
    ++ [ hosts.scylla.publicKey ];
  "secrets/lan/nibylandia-ddns-kea.age".publicKeys = ar
    ++ [ hosts.scylla.publicKey ];
  "secrets/lan/nibylandia-ddns-bind.age".publicKeys = ar
    ++ [ hosts.scylla.publicKey ];
  "secrets/notbotEnvironment.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/nextCloudAdmin.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/nextCloudExporter.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/norkclubMinecraftRestic.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/cassAuth.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/miniflux.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/stuffAuth.age".publicKeys = ar ++ [ hosts.stereolith.publicKey ];
  "secrets/wg/nibylandia_zorigami.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/ar.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/apo.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/amie.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/mastodon.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/mastodonPlain.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/madargon.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/enki.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/matrix.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/vaultwarden.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/vaultwardenPlain.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/keycloak.age".publicKeys = ar ++ [ hosts.zorigami.publicKey ];
  "secrets/mail/keycloakPlain.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/keycloakDatabase.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/synapseExtraConfig.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/gitea-runner-token-zorigami.age".publicKeys = ar
    ++ [ hosts.zorigami.publicKey ];
  "secrets/gitea-runner-token-scylla.age".publicKeys = ar
    ++ [ hosts.scylla.publicKey ];
  "secrets/ci-secrets.age".publicKeys = ar ++ (with hosts; [
    scylla.publicKey
    zorigami.publicKey
  ]); # TODO: we're not getting ssh keys for the generated disk image, so we need to embed it at disk image build time

  inherit ar;
  inherit hosts;
}
