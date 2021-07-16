{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
, libzen
, libmediainfo
, zlib
}:

mkDerivation rec {
  pname = "coreinfo";
  version = "4.2.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzaaqk7skabmaaaanmcpkl0nshr8axbfgaaw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime libzen libmediainfo zlib ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "File information tool for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
