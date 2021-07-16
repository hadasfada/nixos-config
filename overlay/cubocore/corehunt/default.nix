{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
}:

mkDerivation rec {
  pname = "corehunt";
  version = "4.3.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzaaqk7skabmaam7nmcpkl0nshr8axbfgwnw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "File finder utility for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
