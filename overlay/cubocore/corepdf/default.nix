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
    sha256 = "f848149ddf54156e6876ff770f352623031cbbeebd1d6d9aa72bc042f2d65fcc";
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
