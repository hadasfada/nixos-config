{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, udisks
}:

mkDerivation rec {
  pname = "libcsys";
  version = "4.2.0";

  src = fetchFromGitLab {
    owner = "cubocore";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gzn6aqk7akzbmrnm7nmcpkl0nphr8axbfgwnw552dnk6v8sna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase udisks ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
