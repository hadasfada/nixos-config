{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
, poppler
}:

mkDerivation rec {
  pname = "corepdf";
  version = "4.3.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzaaqk7skabmaaaanmcpkl0nshr8axbfgaaa552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime poppler ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "PDF viewer for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
