# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_lqx;
    kernelParams = ["nomce" "loglevel=3" # cleaner boot
    "amdgpu.si_support=1" "radeon.si_support=0" # enable amdgpu support for hainan
    "module_blacklist=iTCO_wdt" "mitigations=off" # some tweaks to make my potato run cooler
    "i915.fastboot=1" ];
  };

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
  powerManagement.cpuFreqGovernor = "performance";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp1s0.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };
  time.timeZone = "Europe/Istanbul";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "tr_TR.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "trq";
   };

# Services
  services = {
      xserver = {
        enable = true;
        layout = "tr";
        wacom.enable = true;
        libinput.enable = true;
        displayManager.lightdm.enable = true;
        desktopManager.xfce.enable = true;
        displayManager.sessionCommands = ''
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --newmode "1280x720_75.00"   95.75  1280 1360 1488 1696  720 723 728 755 -hsync +vsync
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --addmode HDMI-1 "1280x720_75.00"
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode "1280x720_75.00"
        '';
        };
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      printing = {
        enable = true;
        drivers = [pkgs.gutenprint];
      };
      flatpak.enable = true;
      blueman.enable = true;
  };
  xdg.portal.enable = true;
  
  fonts = {
  fonts = with pkgs; [ noto-fonts source-code-pro ];
  fontconfig = {
    localConf = ''
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
<match target="font">
	<edit mode="assign" name="antialias">
		<bool>true</bool>
	</edit>
	<edit mode="assign" name="embeddedbitmap">
		<bool>false</bool>
	</edit>
	<edit mode="assign" name="hinting">
		<bool>true</bool>
	</edit>
	<edit mode="assign" name="hintstyle">
		<const>hintslight</const>
	</edit>
	<edit mode="assign" name="lcdfilter">
		<const>lcddefault</const>
	</edit>
	<edit mode="assign" name="rgba">
		<const>rgb</const>
	</edit>
    </match>
</fontconfig>
    '';
    };
  };

  security.rtkit.enable = true;

  users = {
    #defaultUserShell = pkgs.zsh;
    users.musfay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };
  };
# ============ packages =================

  programs = {
    bash.shellAliases = {
    "calm" = "sudo nixos-rebuild switch";
    "nixconf" = "sudo nvim /etc/nixos/configuration.nix";
    "ls" = "ls --color=tty";
    "testc" = "gcc test.c -o test ; ./test";
    "testclang" = "clang test.c -o test ; ./test";
    };

    zsh = {
      enable = true;
    };  
    nm-applet.enable = true;  
    adb.enable = true;  
  };

# hardware acceleration  
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
    
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # languages
    gcc
    python39Full
    micropython
    go
    rustc
    nodejs-16_x
    clang_12
    # editors
    neovim
    vscodium
    arduino
    # multimedia
    vlc
    kodi
    pulseeffects-pw
    # version control
    gitFull
    gh
    # emulation
    wineStaging
    # themes
    matcha-gtk-theme
    papirus-icon-theme
    # browsers
    ungoogled-chromium
    brave
    # games
    multimc
    minecraft
    steam
    osu-lazer
    # chat
    tdesktop
    discord
    zoom-us
    # misc
    libreoffice-fresh
    xfce.xfce4-whiskermenu-plugin
    pavucontrol
    xfce.xfce4-pulseaudio-plugin
    # other tools
    nmap
    xorg.xrandr
    obs-studio
    neofetch
    fritzing
    evince
    gnome3.simple-scan
    glxinfo
   ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}
