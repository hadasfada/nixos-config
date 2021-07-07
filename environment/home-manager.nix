{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {

    useGlobalPkgs = true;

    users.my4664 = { pkgs, ... }: {
      home.packages = with pkgs; [
        ngrok
        nmap-unfree
        home-manager
        git
        gh
        python3
        nodejs-16_x
        neofetch
        usbutils
        pciutils
        gcc
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
