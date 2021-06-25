{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {
    useGlobalPkgs = true;
    users.musfay = { pkgs, ... }: {
      home.packages = with pkgs; [
        ngrok nmap-unfree home-manager
      ];
      programs = {
        git = {
          enable = true;
          userName = "Mustafa Çalışkan";
          userEmail = "musfay@protonmail.com";
          extraConfig = {
            credential.helper = "${pkgs.gh}/bin/gh";
          };
        };
        neovim.enable = true;
        gh.enable = true;
      };
    };
  };
}
