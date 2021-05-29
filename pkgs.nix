{ config, pkgs, lib, ... }:

{
  programs = {
    bash.shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "upgrade" = "sudo nixos-rebuild --upgrade switch";
      "config-nixos" = "sudo nvim /etc/nixos/configuration.nix";
      "config-pkgs" = "sudo nvim /etc/nixos/pkgs.nix";
      "config-boot" = "sudo nvim /etc/nixos/boot.nix";
      "config-services" = "sudo nvim /etc/nixos/services.nix";
      "ls" = "ls --color=tty";
    };
    nm-applet.enable = true;  
    adb.enable = true;  
  };

# hardware acceleration  
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
    
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    gcc                       matcha-gtk-theme
    python39Full              papirus-icon-theme
    micropython               multimc
    go                        minecraft
    rustc                     steam
    nodejs-16_x               osu-lazer
    clang_12                  discord
    neovim                    tdesktop
    vscodium                  zoom-us
    arduino                   libreoffice-fresh
    vlc                       gparted
    pulseeffects-pw           xorg.xrandr
    gitFull                   obs-studio
    gh                        neofetch
    clang-tools               fritzing
    wineStaging               evince
    chromium                  gnome3.simple-scan
    gnupg                     pass
    pavucontrol               openboard
    nmap                      geekbench
    elementary-planner        glxinfo              
    
    # xfce stuff
    xfce.xfce4-whiskermenu-plugin 
    xfce.xfce4-pulseaudio-plugin   
   ];
  system.stateVersion = "unstable";
}