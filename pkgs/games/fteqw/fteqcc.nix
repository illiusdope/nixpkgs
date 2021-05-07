{ lib
, stdenv
, fetchsvn
, zlib
}:

stdenv.mkDerivation rec {
  name = "fteqcc";
  version = "5829";

  src = fetchsvn {
    url = "http://svn.code.sf.net/p/fteqw/code/trunk/engine/qclib";
    rev = version;
    sha256 = "07y9rkpk4yxbw2m9w40rsb918al3dz27xg5yx7g9yj4mp8wfwak6";
  };

  buildInputs = [
    zlib
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp -v fteqcc.bin $out/bin/fteqcc
  '';

  meta = with lib; {
    description = "An advanced QuakeC compiler";
    homepage = "https://fte.triptohell.info";
    license = with licenses; [ gpl2 ];
    maintainers = with maintainers; [ illiusdope ];
  };
}
