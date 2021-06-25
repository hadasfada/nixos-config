{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./boot.nix
      ./pipewire.nix
      ./xserver.nix
      ./fonts.nix
      ./hardware.nix
      ./pkgs.nix
      ./home-manager.nix
    ];

  services = {
    printing = {
      enable = true;
      drivers = [pkgs.gutenprint];
    };
    flatpak.enable = true;
    blueman.enable = true;
  };

  xdg.portal.enable = true;
}
