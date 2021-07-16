{ pkgs, makeScope, libsForQt5 }:
let
  packages = self: with self; {

    # libraries
    libcprime = callPackage ./libcprime { };
    libcsys = callPackage ./libcsys { };

    ### coreapps
    coreaction = callPackage ./coreaction { };
    corearchiver = callPackage ./corearchiver { };
    corefm = callPackage ./corefm {
      stdenv = llvmPackages_latest.stdenv;
    };
    coregarage = callPackagae ./coregarage { };
    corehunt = callPackage ./corehunt { };
    coreimage = callPackage ./coreimage { };
    coreinfo = callPackage ./coreinfo { };
    corekeyboard = callPackage ./corekeyboard {
      inherit(xorg) libX11 libXtst;
    };
    corepad = callPackage ./corepad { };
    corepaint = callPackage ./corepaint { };
    corepdf = callPackage ./corepdf { };
    corepins = callPackage ./corepins { };
    corerenamer = callPackage ./corerenamer { };
  };
in
makeScope libsForQt5.newScope packages
