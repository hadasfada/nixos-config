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
    hostName = "deknopisi";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp0s20u7u1.useDHCP = true;
    interfaces.wlp1s0.useDHCP = true;
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
    users.my4664 = {
      initialPassword = "12345";
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ];
    };
  };
}
