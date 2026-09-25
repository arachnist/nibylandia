{
  writeShellApplication,
  curl,
  jq,
  nix-prefetch,
}:
# this is a really cursed thing but honestly it works surprisingly well
writeShellApplication {
  name = "nix-from-compare";
  text = builtins.readFile ./script.sh;
  runtimeInputs = [
    curl
    jq
    nix-prefetch
  ];
}
