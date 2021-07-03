{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./system
      ./environment
      ./hardware-configuration.nix
    ];

  #nixpkgs.overlays = [ ./overlay ];

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

  environment.variables = {
    QT_QPA_PLATFORMTHEME="gtk2";
  };

  users = {
    #defaultUserShell = pkgs.zsh;
    users.milhan46 = {
      initialPassword = "12345";
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ];
    };
  };
}
