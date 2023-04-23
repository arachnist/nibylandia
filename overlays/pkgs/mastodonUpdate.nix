{ runtimeShell, writeScriptBin, mastodon, symlinkJoin }:

let
  name = "mastodon-update.sh";
  script = writeScriptBin name ''
    #!${runtimeShell}
    exec ${mastodon.updateScript}/bin/update.sh "$@"
  '';

in symlinkJoin {
  inherit name;
  paths = [ script ];
}
