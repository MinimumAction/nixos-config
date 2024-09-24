# mycroft Configuration
# config for lenovo t14 w/ AMD CPU

{ config, lib, pkgs, ... }:{

  # Imports
  imports =[ 
    ./hardware-configuration.nix # hardware config (generated by NixOS)
    ./../../modules/desktop-environments/budgie.nix # desktop environment
    ./../../modules/defaults.nix # default settings & programs
    ./../../modules/graphical.nix # graphical programs
  ];

  # DO NOT CHANGE
  system.stateVersion = "24.05";

  # Networking and Host name
  networking.hostName = "mycroft";
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keyboard settings
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Sound settings
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Users
  users.users.minimumaction = {
    isNormalUser = true;
    description = "Kevin Liguori";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
  };

  # Host specific system packages
  environment.systemPackages = with pkgs; [];

}
