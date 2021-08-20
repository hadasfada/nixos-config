{
  imports = [ <home-manager/nixos> ];

  home-manager = {
    useGlobalPkgs = true;
    users.musfay = import ./home.nix;
  };
}
