{ config, lib, pkgs, modulesPath, ... }:

{

  # Imports
  imports =[ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" # minimal NixOS install
    ./../../nixosModules/defaults.nix # default settings/programs
    # live specific settings/programs
  ];


  # Drivers for external wifi adapter
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
  boot.initrd.kernelModules = [ "8812au" ];


  # Graphics Card Support
  hardware.opengl.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };


  # Printing
  services.printing.enable = true;


  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
