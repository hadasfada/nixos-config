{ pkgs, lib, ... }:

let mod = "Mod1"; in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+d"      = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${mod}+Return" = "exec alacritty";
        "${mod}+b"      = "exec chromium";
      };

      bars = [
        { position = "top"; }
      ];
    };

    extraConfig = ''
      default_border pixel 1
      default_floating_border pixel 1

      gaps inner 10
      gaps outer 10

      exec --no-startup-id "${pkgs.feh}/bin/feh --bg-fill /etc/nixos/wallpaper.png"
      exec chromium
    '';
  };

  programs.i3status = {
    enable = true;
  };
}
