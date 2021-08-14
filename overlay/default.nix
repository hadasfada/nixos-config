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

      vim_configurable = vim_configurable.overrideAttrs (old: rec {
          version = "8.2.3340";
          src = fetchFromGitHub {
            owner = "vim";
            repo = "vim";
            rev = "v${version}";
            sha256 = "sha256-QMY2DGASAqishIiZy/jfmDxNsGftoEJbAwPtmEO9zws=";
          };
      });
    }
  )];
}
