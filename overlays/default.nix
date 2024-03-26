{
  nibylandia = final: prev: (import ./nibylandia.nix) final prev;
  rpi5 = final: prev: (import ./rpi5.nix) final prev;
}
