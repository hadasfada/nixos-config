{ pkgs, ... }: {

  home.packages = with pkgs; [
    ngrok                      android-tools
    nmap                       qdl
    home-manager               bootiso
    python3                    usbutils
    nodejs-16_x                neofetch
    llvmPackages_latest.clang  pciutils
    rustc                      cargo
    go                         gh
    picom                      fd
    ghc                        ripgrep
  ];

  programs.git = {
    enable = true;
    userName = "Mustafa Çalışkan";
    userEmail = "musfay@protonmail.com";
    signing.signByDefault = true;
    signing.key = null;
    extraConfig = {
      credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
    };
  };

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

  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "ls" = "ls --color=tty";
    };
  };
}
