{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "mkbootimg";
  version = "2021.04.27";

  src = fetchFromGitHub {
    owner = "osm0sis";
    repo = pname;
    rev = version;
    sha256 = "sha256-rcwJLzHpd22f2TH1fcdMRrNXlju/EHF4Dy32N8NnN10=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 {mkbootimg,unpackbootimg} -t $out/bin
    runHook postInstall
  '';

  NIX_CFLAGS_COMPILE = [
    "-Wno-error=address-of-packed-member"
  ];
}
