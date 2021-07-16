{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcsys
, libcprime
}:

mkDerivation rec {
  pname = "corefm";
  version = "4.2.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzn6aqk7skzbmrnm7nmcpkl0nshr8axbfgwnw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcsys libcprime ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "A file manager for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
