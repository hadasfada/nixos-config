{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {

    useGlobalPkgs = true;

    users.musfay = { pkgs, ... }: {
      imports = [
        ./gitAndTools.nix
      ];

      home.packages = with pkgs; [
        ngrok
        nmap-unfree
        home-manager
        gh
        python3
        neofetch
        usbutils
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
