{
  description = "System flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
       modules = [
        ./configuration.nix
	./hardware-configuration.nix
      
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.users.musfay = import ./modules/home.nix;
        }
      ];
    };
  };
}

