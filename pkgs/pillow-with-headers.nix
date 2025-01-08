{ python311Packages, ... }:

python311Packages.pillow.overrideAttrs (_: {
  postInstall = ''
    mkdir -p $out/include/libImaging
    cp src/libImaging/*.h $out/include/libImaging
  '';
})
