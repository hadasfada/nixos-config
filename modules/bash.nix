{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "configRepo" = "pushd $CONFIG_PATH";
      "ls" = "ls --color=tty";
    };
    bashrcExtra = ''
      export CONFIG_PATH=$HOME/.nixos-config
      source $CONFIG_PATH/environment/scripts/configControl.sh
      source $CONFIG_PATH/environment/scripts/papermc.sh
      source $CONFIG_PATH/environment/scripts/ngrok.sh
      source $CONFIG_PATH/environment/scripts/repoControl.sh
    '';
  };
}
