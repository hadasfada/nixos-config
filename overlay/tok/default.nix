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
    rev = "1c3b891458cffb2c9fa743916cc4b4a9ca9548d9";
    sha256 = "sha256-G5xuWa1TY6dRikIU0WAONYSGbAhKR0WMnAr84pn1OQE=";
  };

  buildInputs = [
    full kirigami2
    knotifications kconfigwidgets kitemmodels
    kwindowsystem ki18n zlib rlottie tdlib
  ];

  nativeBuildInputs = [
    qbs cmake pkg-config qttools jq
    wrapGAppsHook wrapQtAppsHook
  ];

  patchPhase = ''
    patchShebangs src/
  '';

  configurePhase = ''
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

  #meta = with lib; {
  #  description = "Telegram client built using Kirigami";
  #  homepage = "https://invent.kde.org/network/tok";
  #  license = licenses.gpl3;
  #  maintainers = with maintainers; [ musfay ];
  #  platforms = platforms.linux;
  #};
}
