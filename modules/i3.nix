{ pkgs, lib, ... }:

let mod = "Mod1"; in

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+d"      = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${mod}+Return" = "exec alacritty";
        "${mod}+b"      = "exec chromium";
      };

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
        }
      ];
    };
  };
}
