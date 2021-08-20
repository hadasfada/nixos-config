{ pkgs, ... }: {

  fonts = {
    fonts = with pkgs; [ noto-fonts source-code-pro open-sans ];
    fontconfig.localConf = builtins.readFile ./local.conf;
  };

}
