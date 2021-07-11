{ config, pkgs, lib, ... }:

{
  environment.interactiveShellInit = ''
    export CONFIG_PATH=$HOME/.nixos-config
    source $CONFIG_PATH/environment/scripts/configControl.sh
    source $CONFIG_PATH/environment/scripts/papermc.sh
    source $CONFIG_PATH/environment/scripts/ngrok.sh
    source $CONFIG_PATH/environment/scripts/repoControl.sh
  '';
}
