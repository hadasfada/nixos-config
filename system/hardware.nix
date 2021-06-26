{ config, pkgs, lib, ... }:

{
hardware = {
    cpu.intel.updateMicrocode = true;
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
}
