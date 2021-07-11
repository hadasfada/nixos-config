{ config, pkgs, lib, ... }:

{
  programs = {
    nm-applet.enable = true;
    steam.enable = true;
    gamemode.enable = true;
  };

# hardware acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    chromium                  openboard
    matcha-gtk-theme          vlc
    papirus-icon-theme        system-config-printer
    multimc                   element-desktop
    evince                    pavucontrol
    clang-tools               sx
    gnome3.simple-scan        handbrake
    discord                   fritzing
    tdesktop                  vscodium
    zoom-us                   osu-lazer
    libreoffice-fresh         obs-studio
    gparted                   gimp
    pulseeffects-pw           xorg.xrandr
    okular                    mangohud
    lightlocker               mkbootimg

    # plugins for theme QT apps on xfce properly
    libsForQt5.qtstyleplugins

    # xfce stuff
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin

    # kodi and extra plugins
    (kodi.passthru.withPackages (kodiPkgs: with kodiPkgs; [
      pvr-iptvsimple
    ]))
   ];
  system.stateVersion = "unstable";
}
