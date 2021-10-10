{ config, pkgs, lib, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;

    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_zen;


     
  };

  powerManagement.cpuFreqGovernor = "performance";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  fonts = {
    fonts = with pkgs; [ noto-fonts source-code-pro open-sans ];
    fontconfig.localConf = builtins.readFile ./modules/local.conf;
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
    
      wacom.enable = true;
      libinput.enable = true;

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      videoDrivers = [ "nvidia" ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
   
  
  };

  xdg.portal.enable = true;  

  hardware = {
    cpu.intel.updateMicrocode = true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      enable = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    
      };

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "us.UTF-8";

  console = {
     font = "Lat2-Terminus16";
     keyMap = "trq";
  };

  security.rtkit.enable = true;

  environment.variables = {
    QT_QPA_PLATFORMTHEME="gtk2";
  };

  users = {
    users.hadasfada = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ];
    };
  };

  programs = {
    adb.enable = true;
    steam.enable = true;
  };


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
                      
    firefox                   
    vlc
    system-config-printer
    xorg.xrandr
    pavucontrol               
    discord                   
    tdesktop                  
    libreoffice-fresh         
             
                   
  ];
}
