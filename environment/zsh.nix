{
  programs.zsh = {
    enable = true;
    initExtra = ''
      source $HOME/.nixos-config/environment/scripts/*sh
      any-nix-shell zsh --info-right | source /dev/stdin
    '';
    oh-my-zsh = {
      enable = true;
      theme = "strug";
      plugins = [ "git" ];
    };
  };
}
