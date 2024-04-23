{ lib, stdenv, fetchFromGitHub, openssl, buildPackages, runCommand, clangStdenv
, fetchpatch, libuuid, python3 }:

let
  srcWithVendoring = fetchFromGitHub {
    owner = "worproject";
    repo = "rpi5-uefi";
    rev = "c1ca184c608dca75a346cc56b8eaf42648d83e86";
    fetchSubmodules = true;
    hash = "sha256-mGMqgJXsEFq79aHes8HUGcKrfbGjeAHTA/xzbq5qURs=";
  };
  pythonEnv = buildPackages.python3.withPackages (ps: [ ps.tkinter ]);
in stdenv.mkDerivation {
  name = "rpi5-edk2-tools";
  version = "20240316";

  # We don't want EDK2 to keep track of OpenSSL,
  # they're frankly bad at it.
  src = runCommand "edk2-unvendored-src" { } ''
    cp --no-preserve=mode -r ${srcWithVendoring} $out
    rm -rf $out/edk2/CryptoPkg/Library/OpensslLib/openssl
    mkdir -p $out/edk2/CryptoPkg/Library/OpensslLib/openssl
    tar --strip-components=1 -xf ${buildPackages.openssl.src} -C $out/edk2/CryptoPkg/Library/OpensslLib/openssl
    chmod -R +w $out/

    # Fix missing INT64_MAX include that edk2 explicitly does not provide
    # via it's own <stdint.h>. Let's pull in openssl's definition instead:
    sed -i $out/edk2/CryptoPkg/Library/OpensslLib/openssl/crypto/property/property_parse.c \
        -e '1i #include "internal/numbers.h"'
  '';

  nativeBuildInputs = [ pythonEnv ];
  depsBuildBuild = [ buildPackages.stdenv.cc buildPackages.bash ];
  depsHostHost = [ libuuid ];
  strictDeps = true;

  # trick taken from https://src.fedoraproject.org/rpms/edk2/blob/08f2354cd280b4ce5a7888aa85cf520e042955c3/f/edk2.spec#_319
  GCC5_AARCH64_PREFIX = stdenv.cc.targetPrefix;

  makeFlags = [ "-C edk2/BaseTools" "-j 14" ];

  env.NIX_CFLAGS_COMPILE = "-Wno-return-type"
    + lib.optionalString stdenv.cc.isGNU " -Wno-error=stringop-truncation"
    + lib.optionalString stdenv.isDarwin " -Wno-error=macro-redefined";

  hardeningDisable = [ "format" "fortify" ];

  installPhase = ''
    mkdir -vp $out
    mv -v edk2/BaseTools $out
    mv -v edk2/edksetup.sh $out
    # patchShebangs fails to see these when cross compiling
    for i in $out/BaseTools/BinWrappers/PosixLike/*; do
      substituteInPlace $i --replace '/usr/bin/env bash' ${buildPackages.bash}/bin/bash
      chmod +x "$i"
    done
  '';
}
