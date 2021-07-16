{ config, pkgs, lib, ... }:

{
  programs = {
    nm-applet.enable = true;
    gamemode.enable = true;
    gnupg.agent.enable = true;
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
    element-desktop           xorg.xrandr
    pavucontrol               okular
    clang-tools               lightlocker
    gnome.simple-scan         handbrake
    discord                   fritzing
    tdesktop                  vscodium
    libreoffice-fresh         obs-studio
    gimp

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
