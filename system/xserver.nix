{ config, pkgs, lib, ... }:

let xrandr = lib.getBin pkgs.xorg.xrandr ++ "/bin/xrandr"; in

{
  services.xserver = {
    enable = true;
    layout = "tr";
    wacom.enable = true;
    libinput.enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    displayManager.sessionCommands = ''
      ${xrandr} --newmode "1280x720_75.00"   95.75  1280 1360 1488 1696  720 723 728 755 -hsync +vsync
      ${xrandr} --addmode HDMI-1 "1280x720_75.00"
      ${xrandr} --output HDMI-1 --mode "1280x720_75.00"
    '';
  };
}
