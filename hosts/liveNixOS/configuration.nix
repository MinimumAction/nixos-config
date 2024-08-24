# liveNixOS configuration
# live usb configuration

{ config, lib, pkgs, modulesPath, ... }:{

  # Imports
  imports =[ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" # minimal NixOS install
    ./../../nixosModules/defaults.nix # default settings/programs
  ];

  # Drivers for external wifi adapter
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
  boot.initrd.kernelModules = [ "8812au" ];

  # Live usb specific system packages
  environment.systemPackages = with pkgs; [];

}
