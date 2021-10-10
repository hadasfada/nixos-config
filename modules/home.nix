{ pkgs, ... }: {

  home.packages = with pkgs; [
    ngrok                      android-tools                       
    home-manager
    python3                    usbutils
    nodejs-16_x                neofetch
    llvmPackages_latest.clang  pciutils
  ];

  programs.git = {
    enable = true;
    userName = "Efe Altınkaynak";
    userEmail = "altinkaynakefe@gmail.com";
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
