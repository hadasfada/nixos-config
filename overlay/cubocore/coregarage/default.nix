{ mkDerivation
, lib
, fetchFromGitLab
, cmake
, qtbase
, libcprime
, libarchive-qt
}:

mkDerivation rec {
  pname = "coregarage";
  version = "4.3.0";

  src = fetchFromGitLab {
    owner = "cubocore/coreapps";
    repo = pname;
    rev = "v${version}";
    sha256 = "167gznaaqk7skabmrnm7nmcpkl0nshr8axbfgwnw552dnk6v8gna";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase libcprime libarchive-qt ];

  meta = with lib; {
    homepage = "https://cubocore.org";
    description = "Settings manager for C Suite";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
