{
  programs.zsh = {
    enable = true;
    initExtra = ''
      source $HOME/.nixos-config/modules/scripts/*sh
      any-nix-shell zsh --info-right | source /dev/stdin
    '';

    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "ls" = "ls --color=tty";
    };

    oh-my-zsh = {
      enable = true;
      theme = "strug";
      plugins = [ "git" ];
    };
  };
}
