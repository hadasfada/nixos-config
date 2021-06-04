{ config, pkgs, lib, ... }:

{  
  services = {
      xserver = {
        enable = true;
        layout = "tr";
        wacom.enable = true;
        libinput.enable = true;
        displayManager.lightdm.enable = true;
        desktopManager.xfce.enable = true;
        displayManager.sessionCommands = ''
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --newmode "1280x720_75.00"   95.75  1280 1360 1488 1696  720 723 728 755 -hsync +vsync
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --addmode HDMI-1 "1280x720_75.00"
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode "1280x720_75.00"
        '';
        };
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        media-session.config.bluez-monitor.rules = [
          {
            # Matches all cards
            matches = [ { "device.name" = "~bluez_card.*"; } ];
            actions = {
              "update-props" = {
                "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
                # mSBC is not expected to work on all headset + adapter combinations.
                "bluez5.msbc-support" = true;
              };
            };
          }
          {
            matches = [
              # Matches all sources
              { "node.name" = "~bluez_input.*"; }
              # Matches all outputs
              { "node.name" = "~bluez_output.*"; }
            ];
            actions = {
              "node.pause-on-idle" = false;
            };
          }
        ];
      };
      printing = {
        enable = true;
        drivers = [pkgs.gutenprint];
      };
      flatpak.enable = true;
      blueman.enable = true;
  };
  xdg.portal.enable = true;
  
  fonts = {
  fonts = with pkgs; [ noto-fonts source-code-pro ];
  fontconfig = {
    localConf = ''
      <?xml version='1.0'?>
      <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
      <fontconfig>
      <match target="font">
            <edit mode="assign" name="antialias">
                  <bool>true</bool>
	    </edit>
	    <edit mode="assign" name="embeddedbitmap">
		  <bool>false</bool>
	    </edit>
	    <edit mode="assign" name="hinting">
		  <bool>true</bool>
	    </edit>
	    <edit mode="assign" name="hintstyle">
		  <const>hintslight</const>
	    </edit>
	    <edit mode="assign" name="lcdfilter">
		  <const>lcddefault</const>
	    </edit>
	    <edit mode="assign" name="rgba">
		  <const>rgb</const>
	    </edit>
       </match>
       </fontconfig>
    '';
    };
  };
}
