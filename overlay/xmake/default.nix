{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "xmake";
  version = "2.5.6";

  src = fetchFromGitHub {
    owner = "xmake-io";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Qqng6hWCNdDpzhBPmvITTX/n9e/r5BgzU3m6u3gbBLc=";
  };

  installFlags = [ "PREFIX=$(out)"];
}
