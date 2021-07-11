{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {
    useGlobalPkgs = true;
    users.musfay = { pkgs, ... }: {
      imports = [
        ./gitAndTools.nix
        ./bash.nix
      ];
      home.packages = with pkgs; [
        ngrok
        nmap-unfree
        home-manager
        python3
        nodejs-16_x
        neofetch
        usbutils
        pciutils
        llvmPackages_latest.clang
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
