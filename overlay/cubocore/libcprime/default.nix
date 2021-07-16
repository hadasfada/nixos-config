{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, qtconnectivity
}:

mkDerivation rec {
  pname = "libcprime";
  version = "4.2.2";

  src = fetchFromGitLab {
    owner = "cubocore";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzn6aqk7akzbmrnm7nmcpkl0nphr8axbfgwnw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase qtconnectivity ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
