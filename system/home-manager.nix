{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.musfay = { pkgs, ... }: {
      home.packages = with pkgs; [
        ngrok nmap-unfree gh
      ];
      programs.git = {
        enable = true;
        userName = "Mustafa Çalışkan";
        userEmail = "musfay@protonmail.com";
        extraConfig = {
          credential.helper = "${pkgs.gh}/bin/gh";
        };
      };
      programs.neovim.enable = true;
    };
  };
}
