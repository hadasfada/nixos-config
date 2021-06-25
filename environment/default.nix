{ config, pkgs, lib, ... }:

{
  imports =
    [
      #./minecraft-server.nix
      ./home-manager.nix
    ];
}
