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

  hardware = {
    cpu.intel.updateMicrocode = true;
    opentabletdriver.enable = true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver 
        vaapiIntel         
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
	      };
      };
    };
  };
  powerManagement.cpuFreqGovernor = "performance";
}
