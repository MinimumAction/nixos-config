{

  # Flake for NixOS configurations
  description = "NixOS configurations";


  # Flake inputs
  inputs = {

    # Nix packages repo
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager repo
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  # Flake outputs
  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    
    # Configurations
    nixosConfigurations = {
      
      # Desktop config
      CaptainNixOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/captainNixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.minimumaction = import ./home/home.nix;
          }
        ];
      };
  
      # Live usb config
      live = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixosLive/configuration.nix
        ];
      };
    
    };
  
  };

}