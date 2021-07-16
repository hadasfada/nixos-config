{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
}:

mkDerivation rec {
  pname = "corepins";
  version = "4.3.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzaaqkaaaabmaaaanmcpkl0nshr8axbfgaaw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "Bookmarking app for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
