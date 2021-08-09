{ config, lib, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager = {
    useGlobalPkgs = true;
    users.musfay = { pkgs, ... }: {
      imports = [
        ./gitAndTools.nix
        ./bash.nix
        ./zsh.nix
      ];
      home.packages = with pkgs; [
        ngrok
        nmap-unfree                qdl
        home-manager               bootiso
        python3                    usbutils
        nodejs-16_x                neofetch
        llvmPackages_latest.clang  pciutils
        rustc                      cargo
        go                         gh
        any-nix-shell              deno
      ];

      programs.vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          vim-airline editorconfig-vim jedi-vim
        ];
      };

      programs.alacritty = {
        enable = true;
        settings.background_opacity = 0.8;
      };
    };
  };
}
