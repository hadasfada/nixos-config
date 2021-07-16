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
        ngrok                      android-tools
        nmap-unfree                qdl
        home-manager               bootiso
        python3                    usbutils
        nodejs-16_x                neofetch
        llvmPackages_latest.clang  pciutils
        rustc                      cargo
        go
      ];

      programs = {
        neovim.enable = true;
      };
    };
  };
}
