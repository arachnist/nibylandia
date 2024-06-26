{ lib, stdenv, fetchFromGitHub, buildPackages, pkgsCross }:

stdenv.mkDerivation rec {
  name = "arm-trusted-firmware-rpi5";
  version = "20240316";

  src = fetchFromGitHub {
    owner = "worproject";
    repo = "arm-trusted-firmware";
    rev = "682607fbd775e37fb5631508434dab9e60220c9a";
    hash = "sha256-Kdn9xJtHhwxvqpzC6osW2xWdZrlOmowaxBLPYGmtHYQ=";
  };

  depsBuildBuild = [ buildPackages.stdenv.cc ];
  nativeBuildInputs = [ pkgsCross.arm-embedded.stdenv.cc ];

  makeFlags = [
    "HOSTCC=$(CC_FOR_BUILD)"
    "AS=$(CC_FOR_BUILD)"
    "CROSS_COMPILE=${stdenv.cc.targetPrefix}"
    # binutils 2.39 regression
    # `warning: /build/source/build/rk3399/release/bl31/bl31.elf has a LOAD segment with RWX permissions`
    # See also: https://developer.trustedfirmware.org/T996
    "LDFLAGS=-no-warn-rwx-segments"

    "PLAT=rpi5"
    "PRELOADED_BL33_BASE=0x20000"
    "RPI3_PRELOADED_DTB_BASE=0x1F0000"
    "SUPPORT_VFP=1"
    "SMC_PCI_SUPPORT=1"
  ];

  filesToInstall = [ "build/rpi5/release/*" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r ${lib.concatStringsSep " " filesToInstall} $out

    runHook postInstall
  '';

  hardeningDisable = [ "all" ];
  dontStrip = true;
}
