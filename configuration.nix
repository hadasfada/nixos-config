{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./system/system.nix
      ./hardware-configuration.nix
    ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp1s0.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "tr_TR.UTF-8";

  console = {
     font = "Lat2-Terminus16";
     keyMap = "trq";
  };

  security.rtkit.enable = true;

  users = {
    #defaultUserShell = pkgs.zsh;
    users.musfay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ];
    };
  };
}
