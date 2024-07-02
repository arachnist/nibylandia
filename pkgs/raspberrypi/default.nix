{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  # NOTE: this should be updated with linux_rpi
  pname = "raspberrypi-firmware";
  # raspberrypi/firmware no longers tag the releases. However, since each commit
  # on the stable branch corresponds to a tag in raspberrypi/linux repo, we
  # assume they are cut together.
  version = "stable_20240124";

  src = fetchFromGitHub {
    owner = "raspberrypi";
    repo = "firmware";
    rev = "4649b6d52005b52b1d23f553b5e466941bc862dc";
    hash = "";
  };

  installPhase = ''
    mkdir -p $out/share/raspberrypi/
    mv boot "$out/share/raspberrypi/"
  '';

  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  meta = {
    description = "Firmware for the Raspberry Pi board";
    homepage = "https://github.com/raspberrypi/firmware";
    # Hash mismatch on source, mystery.
    # Maybe due to https://github.com/NixOS/nix/issues/847
    broken = stdenvNoCC.isDarwin;
  };
}
