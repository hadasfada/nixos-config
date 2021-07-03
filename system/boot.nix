{ config, pkgs, lib, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["nomce" "loglevel=3"
    "module_blacklist=iTCO_wdt" "mitigations=off"
    "i915.fastboot=1" ];
  };
  powerManagement.cpuFreqGovernor = "performance";
}
