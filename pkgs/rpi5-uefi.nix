{ lib, stdenv, openssl, pkgsCross
, buildPackages, runCommand, rpi5-arm-tf, rpi5-edk2-tools, libuuid
, python3, bc }:

let
  pythonEnv = buildPackages.python3.withPackages (ps: [ps.tkinter]);
in stdenv.mkDerivation {
  name = "rpi5-arm-uefi";
  
  inherit (rpi5-edk2-tools) src version;

  nativeBuildInputs = [ bc pythonEnv ];
  depsBuildBuild = [ buildPackages.stdenv.cc ];
  strictDeps = true;

  # trick taken from https://src.fedoraproject.org/rpms/edk2/blob/08f2354cd280b4ce5a7888aa85cf520e042955c3/f/edk2.spec#_319
  GCC5_AARCH64_PREFIX = stdenv.cc.targetPrefix;

  prePatch = ''
    rm -rf BaseTools
    ln -sv ${rpi5-edk2-tools}/BaseTools BaseTools
  '';

  configurePhase = ''
    runHook preConfigure
    export WORKSPACE="$PWD"
    . ${rpi5-edk2-tools}/edksetup.sh BaseTools
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    build -a AARCH64 \
      -b RELEASE \
      -t GCC \
      -p edk2-platforms/Platform/RaspberryPi/RPi5/RPi5.dsc \
      -D TFA_BUILD_ARTIFACTS=${rpi5-arm-tf} \
      --pcd gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString=L"${rpi5-edk2-tools.version}" \
      -n $NIX_BUILD_CORES $buildFlags
    
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mv -v Build/*/* $out
    runHook postInstall
  '';
}
