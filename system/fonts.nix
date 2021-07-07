{ config, pkgs, lib, ... }:

{
  fonts = {
    fonts = with pkgs; [ noto-fonts source-code-pro ];
  };
}
