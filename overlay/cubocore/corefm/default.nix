{ mkDerivation
, lib
, fetchFromGitLab
, wrapQtAppsHook
, mold
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
    sha256 = "sha256-PczKIKY9uCD+cAzAC6Gkb+g+cn9KKCQYd3epoZK8bvA=";
  };

  nativeBuildInputs = [ cmake wrapQtAppsHook ];
  buildInputs = [ qtbase libcsys libcprime ];
  EXTRA_LDFLAGS = "-fuse-ld=${mold}/bin/mold";
  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "A file manager for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
