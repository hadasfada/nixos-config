{ config, pkgs, lib, ... }:

{
  programs = {
    bash.shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "config-repo" = "pushd ~/nixos-config";
      "config-ide" = "codium ~/nixos-config";
      "config-apply" = ''
        sudo bash ~/nixos-config/install
        sudo nixos-rebuild switch
      '';
      "ls" = "ls --color=tty";
    };
    nm-applet.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    gnupg.agent.enable = true;
    gnupg.agent.pinentryFlavor = "curses";
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
    lightlocker               pavucontrol
    clang-tools               chromium
    gnome3.simple-scan        handbrake
    discord                   fritzing
    tdesktop                  vscodium
    zoom-us                   osu-lazer
    libreoffice-fresh         obs-studio
    gparted                   gimp
    pulseeffects-pw           xorg.xrandr
    okular                    mangohud

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
