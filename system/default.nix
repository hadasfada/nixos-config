{ pkgs, ... }: {

  imports = [
    ./boot.nix
    ./pipewire.nix
    ./xserver.nix
    ./fonts.nix
    ./hardware.nix
    ./pkgs.nix
  ];

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
  };

  xdg.portal.enable = true;
}
