{ mkCutefishDerivation
, qtbase
, qtx11extras
, qtquickcontrols2
, kwindowsystem
, libxcb
}:

mkCutefishDerivation {
  pname = "fishui";
  repo = pname;
  sha256 = "0akrdca4jjdkfdya36vy1y5vzimrc4pp5jm24rmlw8hbqxvj72ro";
  buildInputs = [ qtbase qtx11extras qtquickcontrols2 kwindowsystem libxcb ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace "/usr/lib" "$out/lib"
  '';

  meta.description = "FishUI is a GUI library based on Qt Quick Controls 2";
}
