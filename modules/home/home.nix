{ pkgs, ... }: {

  imports = [
    ./gitAndTools.nix
    ./bash.nix
    ./i3.nix
  ];

  home.packages = with pkgs; [
    ngrok                      android-tools
    nmap-unfree                qdl
    home-manager               bootiso
    python3                    usbutils
    nodejs-16_x                neofetch
    llvmPackages_latest.clang  pciutils
    rustc                      cargo
    go                         gh
    any-nix-shell              feh
    picom                      taskwarrior
    multimc                    ghc
    fd                         ripgrep
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline editorconfig-vim jedi-vim
    ];
  };

  programs.alacritty = {
    enable = true;
    settings.background_opacity = 0.8;
  };
}
