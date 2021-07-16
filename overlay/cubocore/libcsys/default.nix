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
    sha256 = "sha256-9LH95uJJIn4FHfnikGi5UCI6nUNW+1cSZnJ/KpZDI5Y=";
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
