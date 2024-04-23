{ lib, stdenv, openssl, pkgsCross, buildPackages, runCommand, rpi5-arm-tf
, rpi5-edk2-tools, libuuid, python3, bc, util-linux, nasm, acpica-tools }:

let pythonEnv = buildPackages.python3.withPackages (ps: [ ps.tkinter ]);
in stdenv.mkDerivation rec {
  name = "rpi5-uefi";
  version = "20240316";

  inherit (rpi5-edk2-tools) src;

  nativeBuildInputs = [ bc pythonEnv util-linux nasm acpica-tools ];
  depsBuildBuild = [ buildPackages.stdenv.cc ];
  strictDeps = true;

  # trick taken from https://src.fedoraproject.org/rpms/edk2/blob/08f2354cd280b4ce5a7888aa85cf520e042955c3/f/edk2.spec#_319
  GCC5_AARCH64_PREFIX = stdenv.cc.targetPrefix;

  env.NIX_CFLAGS_COMPILE = toString [ "-Wformat" ];

  prePatch = ''
    rm -rf edk2/BaseTools
    ln -sv ${rpi5-edk2-tools}/BaseTools edk2/BaseTools
  '';

  configurePhase = ''
    runHook preConfigure
    export WORKSPACE="$PWD"
    export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms:$WORKSPACE/edk2-non-osi

    . $WORKSPACE/edk2/edksetup.sh BaseTools
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild

    build -a AARCH64 \
      -b RELEASE \
      -t GCC \
      -p edk2-platforms/Platform/RaspberryPi/RPi5/RPi5.dsc \
      -D TFA_BUILD_ARTIFACTS=${rpi5-arm-tf} \
      --pcd gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString=L"${version}" \
      -n $NIX_BUILD_CORES $buildFlags

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    mv -v Build/RPi5/RELEASE_GCC/FV/RPI_EFI.fd $out/
    mv -v config.txt $out/

    runHook postInstall
  '';
}
