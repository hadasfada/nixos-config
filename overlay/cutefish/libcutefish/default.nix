{ mkCutefishDerivation
, qttools
, qtquickcontrols2
, kscreen
, accountsservice
, modemmanager-qt
, networkmanager-qt
}:

mkCutefishDerivation {
  pname = "libcutefish";
  repo = pname;
  nativeBuildInputs = [ qttools extra-cmake-modules ];
  buildInputs
}
