{ runtimeShell, writeScriptBin, age, symlinkJoin }:

let
  name = "age-crypt";
  ageRecipients = "-r "
    + builtins.concatStringsSep " -r " (map (x: ''"${x}"'') pubKeys);
  script = writeScriptBin name ''
    #!${runtimeShell}
    case $1 in
    smudge)
        exec ${age}/bin/age --decrypt -i ~/.ssh/id_ed25519
    ;;
    clean)
        exec ${age}/bin/age --encrypt ${ageRecipients}
    ;;
    esac
  '';

in symlinkJoin {
  inherit name;
  paths = [ script ];
}
