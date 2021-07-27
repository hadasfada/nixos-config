{ pkgs, makeScope, libsForQt5 }:
let
  packages = self: with self; {
    mkCutefishDerivation = callPackage ./mkCutefishDerivation.nix;

    fishui = callPackage ./fishui {
      inherit(xorg) libxcb;
    };

    cutefish-core = callPackage ./cutefish-core {
      inherit(xorg) libSM libXtst;
    };

  };
in
makeScope libsForQt5.newScope packages
