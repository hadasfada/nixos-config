{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [ (self: super:
    with super;
    {
      #tok = super.libsForQt5.callPackage ./tok { };
      mkbootimg = callPackage ./mkbootimg {};
      sx = callPackage ./sx {
        inherit (xorg) xauth xorgserver;
      };
      cubocore = recurseIntoAttrs (import ./cubocore {
        inherit pkgs;
        inherit (lib) makeScope;
        inherit libsForQt5;
      });
      libarchive-qt = libsForQt5.callPackage ./libarchive-qt { };
      xmake = callPackage ./xmake { };
    }
  )];
}
