{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    layout = "tr";
    wacom.enable = true;
    libinput.enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    windowManager.i3.enable = true;
  };
}
