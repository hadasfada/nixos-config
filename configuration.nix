{ config, pkgs, lib, ... }:

{
  boot = {
    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "/dev/sda1";
      forceInstall = true;
      useOSProber = true;
    };

    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_zen;

    kernelParams = [
      "nomce"
      "loglevel=3"
      "amdgpu.si_support=1"
      "radeon.si_support=0"
      "module_blacklist=iTCO_wdt"
      "mitigations=off"
      "i915.fastboot=1"
    ];
  };

  powerManagement.cpuFreqGovernor = "performance";

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

  fonts = {
    fonts = with pkgs; [ noto-fonts source-code-pro open-sans ];
    fontconfig.localConf = builtins.readFile ./modules/local.conf;
  };

  services = {
    xserver = {
      enable = true;
      layout = "tr";
    
      wacom.enable = true;
      libinput.enable = true;

      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
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

  programs = {
    gnupg.agent.enable = true;
    gnupg.agent.pinentryFlavor = "curses";
    adb.enable = true;
    steam.enable = true;
  };

  # hardware acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    chromium                  openboard
    firefox                   emacs
    matcha-gtk-theme          vlc
    papirus-icon-theme        system-config-printer
    element-desktop           xorg.xrandr
    pavucontrol               okular
    clang-tools               lightlocker
    gnome.simple-scan         handbrake
    discord                   fritzing
    tdesktop                  gimp
    libreoffice-fresh         plasma-browser-integration
    materia-kde-theme         mangohud
    wineStaging               xfce.xfce4-whiskermenu-plugin
  ];
}
