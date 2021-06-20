{ mkDerivation
, lib
, fetchFromGitLab
, callPackage
, wrapQtAppsHook
, wrapGAppsHook
, qbs
, cmake
, pkg-config
, full
, qttools
, kirigami2
, kconfigwidgets
, knotifications
, kwindowsystem
, kitemmodels
, ki18n
, jq
, zlib
, rlottie
}:

# We need latest version of tdlib to compile Tok successfully
let tdlib = callPackage ./tdlib.nix { }; in

mkDerivation rec {
  pname = "tok";
  version = "unstable-2021-06-11";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "network";
    repo = pname;
    rev = "11eb8761f1f36ac74f622329298043bba4a980a2";
    sha256 = "0zwmv6gcnnwaknip2ihd0bixvrh9pjc81clc2ilxsf0d2m7q64x7";
  };

  buildInputs = [ full kirigami2 knotifications kconfigwidgets kitemmodels kwindowsystem ki18n zlib rlottie tdlib ];
  nativeBuildInputs = [ qbs cmake pkg-config qttools jq wrapGAppsHook wrapQtAppsHook ];

  patchPhase = ''
    patchShebangs src/
  '';

  configurePhase = ''
    makeCmakeFindLibs
    qbs resolve qbs.installPrefix:$out
  '';

  buildPhase = ''
    qbs
  '';

  installPhase = ''
    runHook preInstall
    qbs install --install-root /
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/org.kde.Tok \
      "''${gappsWrapperArgs[@]}" \
      "''${qtWrapperArgs[@]}"
  '';

  #meta = with lib; {
  #  description = "Telegram client built using Kirigami";
  #  homepage = "https://invent.kde.org/network/tok";
  #  license = licenses.gpl3;
  #  maintainers = with maintainers; [ musfay ];
  #  platforms = platforms.linux;
  #};
}
