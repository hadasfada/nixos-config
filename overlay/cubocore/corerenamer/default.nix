{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
}:

mkDerivation rec {
  pname = "corerenamer";
  version = "4.2.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzaadd7skabmaaaanmcpkl0nshr8axbfgaaw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "Batch file renamer for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
