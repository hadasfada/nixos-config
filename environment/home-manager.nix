{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {

    useGlobalPkgs = true;

    users.milhan46 = { pkgs, ... }: {
      home.packages = with pkgs; [
        ngrok
        nmap-unfree
        home-manager
        gh
        python3
        nodejs-16_x
        neofetch
        usbutils
        pciutils
        gcc
        qdl
        bootiso
        wineStaging
        android-tools
      ];
      programs = {
        neovim.enable = true;
      };
    };
  };
}
