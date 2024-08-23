# nixosLive configuration

{ config, lib, pkgs, modulesPath, ... }:{

  # Imports
  imports =[ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" # minimal NixOS install
    ./../../nixosModules/defaults.nix # default settings/programs
    ./../../nixosModules/live.nix # live specific settings/programs
  ];

}
