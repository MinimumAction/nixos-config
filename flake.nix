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
  outputs = inputs@{ nixpkgs, home-manager, ... }:
    
    let 
      system = "x86_64-linux";
    in {

    # Configurations
    nixosConfigurations = {
      
      # sherlock desktop config
      sherlock = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/sherlock/configuration.nix
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.minimumaction = import ./home/home.nix;
          }
        ];
      };

      # mycroft (good) laptop config
      # to come later

      # lestrade (useless) laptop config
      lestrade = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/lestrade/configuration.nix
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.minimumaction = import ./home/home.nix;
          }
        ];
      };
  
      # watson live usb config
      watson = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/watson/configuration.nix
        ];
      };

      # moriarty devious usb config
      # to come later
    
    };
  
  };

}