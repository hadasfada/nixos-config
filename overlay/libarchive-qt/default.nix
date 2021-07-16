{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libarchive
, xz
}:

mkDerivation rec {
  pname = "libarchive-qt";
  version = "2.0.4";

  src = fetchFromGitLab {
    owner = "marcusbritanicus";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-onTV9dgk6Yl9H35EvA6/8vk1IrYH8vg9OQNVgzkt4q4=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libarchive xz ];

  meta = with lib; {
    homepage = "https://gitlab.com/marcusbritanicus/libarchive-qt";
    description = "Qt based archiving solution with libarchive backend";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
