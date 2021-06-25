{ config, pkgs, lib, libsForQt5, ... }:

{
  tok = libsForQt5.callPackage ./tok { };
}
