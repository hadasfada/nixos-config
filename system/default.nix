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
    ];

  services = {
    blueman.enable = true;
  };

  xdg.portal.enable = true;
}
