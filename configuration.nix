{ config, pkgs, lib, ... }:

{
  imports = [
      ./system
      ./modules
      ./hardware-configuration.nix
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp1s0.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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
    users.musfay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ];
    };
  };
}
