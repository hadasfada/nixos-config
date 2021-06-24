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
    adb.enable = true;
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
    gcc                       matcha-gtk-theme
    gh                        papirus-icon-theme
    git                       multimc
    usbutils                  vlc
    nmap-unfree               chromium
    glxinfo                   clang-tools
    gnome3.simple-scan        handbrake
    discord                   neofetch
    neovim                    tdesktop
    vscodium                  zoom-us
    arduino                   libreoffice-fresh
    gparted                   gimp
    pulseeffects-pw           xorg.xrandr
    obs-studio                openboard
    fritzing                  pavucontrol
    wineStaging               evince
    osu-lazer                 element-desktop
    system-config-printer

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
