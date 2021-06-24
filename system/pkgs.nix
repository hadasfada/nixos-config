{ config, pkgs, lib, ... }:

{
  programs = {
    bash.shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "config-nixos" = "sudo nvim /etc/nixos/configuration.nix";
      "config-repo" = "pushd ~/nixos-config";
      "config-pkgs" = "sudo nvim /etc/nixos/system/pkgs.nix";
      "config-boot" = "sudo nvim /etc/nixos/system/boot.nix";
      "config-system" = "sudo nvim /etc/nixos/system/";
      "config-update" = "bash ~/nixos-config/update";
      "config-install" = "sudo bash ~/nixos-config/install";
      "config-apply" = ''
        sudo bash ~/nixos-config/install
        sudo nixos-rebuild switch
        bash ~/nixos-config/update'';
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
    multimc                   vlc
    go                        chromium
    rustc                     gnome3.simple-scan
    nodejs-16_x               discord
    neovim                    tdesktop
    vscodium                  zoom-us
    arduino                   libreoffice-fresh
    git                       gparted
    pulseeffects-pw           xorg.xrandr
    usbutils                  obs-studio
    clang-tools               fritzing
    wineStaging               evince
    pass                      element-desktop
    pavucontrol               openboard
    nmap                      elementary-planner
    gimp                      glxinfo
    element-desktop           handbrake
    system-config-printer     neofetch
    osu-lazer                 libsForQt5.qtstyleplugins

    # xfce stuff
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin

    # kodi plugins
    (kodi.passthru.withPackages (kodiPkgs: with kodiPkgs; [
      pvr-iptvsimple
    ]))

   ];
  system.stateVersion = "unstable";
}
