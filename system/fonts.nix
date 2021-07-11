{ config, pkgs, lib, ... }:

{
  fonts = {
    fonts = with pkgs; [ noto-fonts source-code-pro open-sans ];
    #fontconfig.localConf = ./local.conf;
  };
}
