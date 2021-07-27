{ mkCutefishDerivation
, pkg-config
, qtbase
, qtx11extras
, kwindowsystem
, libxcb
, libSM
, libXtst
, polkit
, polkit-qt
, libpulseaudio
}:

mkCutefishDerivation {
  repo = "core";
  sha256 = "0akrdca4jjdkfdya36vy1y5vzimrc4pp5jm24rmlw8hbqxvj72as";

  buildInputs = [
    qtbase
    qtx11extras
    kwindowsystem
    libxcb
    libSM
    libXtst
    polkit
    polkit-qt
    libpulseaudio
  ];
  nativeBuildInputs = [ pkg-config ];

  meta.description = "Cutefish system components and backend";
}
