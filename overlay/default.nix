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

      vim = vim.overrideAttrs (old: {
          version = "8.2.3279";
          sha256 = "sha256-xyY8P4iRpA5UFXJgIoeD1Bsk2g8zaXzfPAGcFhQAPpc=";
      });
    }
  )];
}
