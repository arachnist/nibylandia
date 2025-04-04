{ pillow, ... }:

pillow.overrideAttrs (_: {
  postInstall = ''
    mkdir -p $out/include/libImaging
    cp src/libImaging/*.h $out/include/libImaging
  '';
})
