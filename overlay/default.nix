{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [ (self: super:
    {
      #tok = super.libsForQt5.callPackage ./tok { };
      mkbootimg = super.callPackage ./mkbootimg {};
      sx = super.callPackage ./sx {
        inherit (super.xorg) xauth xorgserver;
      };
      cubocore = super.callPackage ./cubocore { };
      libarchive-qt = super.libsForQt5.callPackage ./libarchive-qt { };
    }
  )];
}
