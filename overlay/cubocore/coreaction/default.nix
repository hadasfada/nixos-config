{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, qtsvg
, libcprime
, libcsys
}:

mkDerivation rec {
  pname = "coreaction";
  version = "4.3.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzn6aqk7akzbmrnm7nmcpkl0nshr8axbfgwnw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase qtsvg libcprime libcsys ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
