{ config, pkgs, lib, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["nomce" "loglevel=3" # cleaner boot
    "amdgpu.si_support=1" "radeon.si_support=0" # enable amdgpu support for hainan
    "module_blacklist=iTCO_wdt" "mitigations=off" # some tweaks to make my potato run cooler
    "i915.fastboot=1" ];
  };
  powerManagement.cpuFreqGovernor = "performance";
}
