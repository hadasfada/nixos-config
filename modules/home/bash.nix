{
  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "ls" = "ls --color=tty";
      "vim" = "nvim";
    };
    bashrcExtra = ''
      export CONFIG_PATH=$HOME/.nixos-config
      source $CONFIG_PATH/modules/scripts/*.sh
    '';
  };
}
