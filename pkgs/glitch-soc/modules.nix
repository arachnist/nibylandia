# this is mostly copied from upstream mastodon packaging, but modified for yarn-berry deps
{ stdenv, nodejs-slim, yarn-berry, brotli,
# previous inputs
glitch-1, yarn-deps, }:
stdenv.mkDerivation {
  pname = "glitch-modules";
  inherit (glitch-1) src version;

  yarnOfflineCache = yarn-deps;

  nativeBuildInputs =
    [ glitch-1.mastodonGems glitch-1.mastodonGems.wrappedRuby ]
    ++ [ nodejs-slim yarn-berry brotli ];

  RAILS_ENV = "production";
  NODE_ENV = "production";

  buildPhase = ''
    runHook preBuild

    export HOME=$PWD

    export YARN_ENABLE_TELEMETRY=0
    mkdir -p ~/.yarn/berry
    ln -sf $yarnOfflineCache ~/.yarn/berry/cache

    yarn install --immutable --immutable-cache

    patchShebangs ~/bin
    patchShebangs ~/node_modules

    # skip running yarn install
    rm -rf ~/bin/yarn

    export SECRET_KEY_BASE_DUMMY=1
    bundle exec rails assets:precompile

    yarn cache clean
    rm -rf ~/node_modules/.cache

    # Remove execute permissions
    find public/emoji -type f ! -perm 0555 \
      -exec chmod 0444 {} ';'

    # Create missing static gzip and brotli files
    find public -maxdepth 1 -type f -regextype posix-extended -iregex '.*\.(js|txt)' \
      -exec gzip --best --keep --force {} ';' \
      -exec brotli --best --keep {} ';'
    find public/emoji -type f -name '*.svg' \
      -exec gzip --best --keep --force {} ';' \
      -exec brotli --best --keep {} ';'
    find public/assets public/packs -type f -regextype posix-extended -iregex '.*\.(css|html|js|js.map|json|svg)' \
      -exec gzip --best --keep --force {} ';' \
      -exec brotli --best --keep {} ';'
    ln -s assets/500.html.gz public/500.html.gz
    ln -s assets/500.html.br public/500.html.br
    ln -s packs/sw.js.gz public/sw.js.gz
    ln -s packs/sw.js.br public/sw.js.br
    ln -s packs/sw.js.map.gz public/sw.js.map.gz
    ln -s packs/sw.js.map.br public/sw.js.map.br

    rm -rf log
    ln -s /var/log/mastodon log
    ln -s /tmp tmp

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/public
    cp -r node_modules $out/node_modules
    cp -r public/assets $out/public
    cp -r public/packs $out/public
    rm $out/node_modules/@mastodon/streaming

    runHook postInstall
  '';
}
