{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {
    useGlobalPkgs = true;
    users.musfay = { pkgs, ... }: {
      home.packages = with pkgs; [
        ngrok nmap-unfree gh home-manager
      ];
      programs.git = {
        enable = true;
        userName = "Mustafa Çalışkan";
        userEmail = "musfay@protonmail.com";
        extraConfig = {
          credential.helper = "gh";
        };
      };
      programs.neovim.enable = true;
    };
  };
}
