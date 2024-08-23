{ config, lib, pkgs, ... }:

{
  # Imports
  imports =[ ./hardware-configuration.nix ];

  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Drivers for external wifi adapter
  # boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
  # boot.initrd.kernelModules = [ "8812au" ];

  
  # Networking
  networking.hostName = "CaptainNixOS";
  networking.networkmanager.enable = true;

  
  # Localization
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Windowing and desktop
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  

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


  # Users
  users.users.minimumaction = {
    isNormalUser = true;
    description = "Kevin Liguori";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
  };


  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;


  # Firefox
  programs.firefox.enable = true;


  # System Packages
  environment.systemPackages = with pkgs; [
    mpv
    lxqt.qterminal
    pciutils
    vscode
    vim 
    neovim
    wget
    neofetch 
    git
    tokyonight-gtk-theme
    anki-bin
  ];

  
  # Excluded Packages
  environment.budgie.excludePackages = with pkgs; [
    vlc
    mate.mate-terminal
  ];


  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };


  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # DO NOT CHANGE
  system.stateVersion = "24.05";

}
