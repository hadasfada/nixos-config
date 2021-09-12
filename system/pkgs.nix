{ pkgs, ... }: {

  programs = {
    gnupg.agent.enable = true;
    gnupg.agent.pinentryFlavor = "curses";
    adb.enable = true;
    steam.enable = true;
  };

  # hardware acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    chromium                  openboard
    firefox                   emacs
    matcha-gtk-theme          vlc
    papirus-icon-theme        system-config-printer
    element-desktop           xorg.xrandr
    pavucontrol               okular
    clang-tools               lightlocker
    gnome.simple-scan         handbrake
    discord                   fritzing
    tdesktop                  gimp
    libreoffice-fresh         plasma-browser-integration
    materia-kde-theme         mangohud
    wineStaging               xfce.xfce4-whiskermenu-plugin
  ];

  system.stateVersion = "unstable";

}
