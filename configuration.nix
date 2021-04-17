# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.kernelParams = ["nomce" "loglevel=3" # cleaner boot
  "amdgpu.si_support=1" "radeon.si_support=0" # enable amdgpu support for hainan
  "module_blacklist=iTCO_wdt" "mitigations=off" # some tweaks to make my potato run cooler
  ];
 
  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Istanbul";

  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "tr_TR.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "trq";
   };

  # X11 and XFCE
  services.xserver = {
     enable = true;
     layout = "tr";
     wacom.enable = true;
     libinput.enable = true;
     displayManager.lightdm.enable = true;
     desktopManager.xfce.enable = true;
  };
  
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --newmode "1280x720_75.00"   95.75  1280 1360 1488 1696  720 723 728 755 -hsync +vsync
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --addmode HDMI-1 "1280x720_75.00"
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode "1280x720_75.00"
  '';
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };

  # Enable sound and pulseaudio
  #sound.enable = true;
  #hardware.pulseaudio = {
  #    enable = true;
  #    extraModules = [ pkgs.pulseaudio-modules-bt ];
  #    package = pkgs.pulseaudioFull;
  #};
  
  # Enable sound and pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
	  };
      };
  };
  
  users = {
    #defaultUserShell = pkgs.zsh;
    users.musfay = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbusers" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };
  };

  programs.bash.shellAliases = {
    "calm" = "sudo nixos-rebuild switch";
    "nixconf" = "sudo nvim /etc/nixos/configuration.nix";
    "ls" = "ls --color=tty";
  };

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git"];
  };
# hardware acceleration  
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver 
      vaapiIntel         
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
# ============ packages =================
  programs.adb.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # languages
    gcc
    python39Full
    micropython
    pkgsCross.avr.buildPackages.gcc
    go
    rustc
    # editors
    neovim
    vscodium
    arduino
    # multimedia
    vlc
    # version control
    git
    gh
    # emulation
    wineStaging
    # themes
    matcha-gtk-theme
    papirus-icon-theme
    # browsers
    chromium
    # games
    steam
    multimc
    # chat
    tdesktop
    discord
    zoom-us
    # misc
    xfce.xfce4-whiskermenu-plugin
    pavucontrol
    xfce.xfce4-pulseaudio-plugin
    # other tools
    xorg.xrandr
    neofetch
    fritzing
    evince
    gnome3.simple-scan
    glxinfo
   ];
  programs.nm-applet.enable = true;
  services.blueman.enable = true;

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
