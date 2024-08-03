let meta = import ./meta.nix;
in {

  "secrets/secureboot-key.age".publicKeys = meta.users.ar ++ (with meta.hosts; [
    khas.publicKey
    microlith.publicKey
    zorigami.publicKey
    scylla.publicKey
    kyorinrin.publicKey
  ]);
  "secrets/secureboot-cert.age".publicKeys = meta.users.ar
    ++ (with meta.hosts; [
      khas.publicKey
      microlith.publicKey
      zorigami.publicKey
      scylla.publicKey
      kyorinrin.publicKey
    ]);
  "secrets/khas-ar.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.khas.publicKey ];
  "secrets/microlith-ar.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.microlith.publicKey ];
  "secrets/amanojaku-ar.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.amanojaku.publicKey ];
  "secrets/kyorinrin-ar.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.kyorinrin.publicKey ];
  "secrets/nix-store.age".publicKeys = meta.users.ar ++ (with meta.hosts; [
    zorigami.publicKey
    scylla.publicKey
    stereolith.publicKey
    khas.publicKey
    microlith.publicKey
    akamanto.publicKey
    amanojaku.publicKey
    tsukumogami.publicKey
    kyorinrin.publicKey
  ]);
  "secrets/wg/nibylandia_scylla.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/wg/dn42_w1kl4s_scylla.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/lan/nibylandia-ddns-kea.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/lan/nibylandia-ddns-bind.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/notbotEnvironment.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/nextCloudAdmin.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/nextCloudExporter.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/norkclubMinecraftRestic.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/cassAuth.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/miniflux.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/stuffAuth.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.stereolith.publicKey ];
  "secrets/wg/nibylandia_zorigami.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/ar.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/apo.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/mastodon.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/mastodonPlain.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey meta.hosts.stereolith.publicKey ];
  "secrets/mail/madargon.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/enki.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/matrix.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/vaultwarden.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/vaultwardenPlain.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/keycloak.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mail/keycloakPlain.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/keycloakDatabase.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/synapseExtraConfig.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mastodon-activerecord.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/mastodon-qa-activerecord.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.stereolith.publicKey ];
  "secrets/gitea-runner-token-zorigami.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/gitea-runner-token-scylla.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/github-runner-token-zorigami.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/github-runner-token-scylla.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.scylla.publicKey ];
  "secrets/ci-secrets.age".publicKeys = meta.users.ar ++ (with meta.hosts; [
    scylla.publicKey
    zorigami.publicKey
  ]); # TODO: we're not getting ssh keys for the generated disk image, so we need to embed it at disk image build time
  "secrets/acme-zorigami-zajeba.li.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/automata.of-a.cat-matrix_key.pem.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/automata.of-a.cat-matrix_env.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
  "secrets/github-runner-token-test262.age".publicKeys = meta.users.ar
    ++ [ meta.hosts.zorigami.publicKey ];
}
