{ runtimeShell, writeScriptBin, mastodon, symlinkJoin }:

let
  name = "mastodon-update.sh";
  script = writeScriptBin name ''
    #!${runtimeShell}
    exec ${mastodon.updateScript} "$@"
  '';

in symlinkJoin {
  inherit name;
  paths = [ script ];
}
