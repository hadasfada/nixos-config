{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [ (self: super:
    {
      #tok = super.libsForQt5.callPackage ./tok { };
      mkbootimg = super.callPackage ./mkbootimg { };
    }
  )];
}
