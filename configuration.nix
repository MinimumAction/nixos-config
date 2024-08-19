{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  
  # Networking
  networking.hostName = "CaptainNixOS";
  networking.networkmanager.enable = true;
  

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  
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


  # Windowing
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  

  # Desktop
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


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
  

  # System Packages
  environment.systemPackages = with pkgs; [
    alacritty
    pciutils
    librewolf
    vscode
    vim 
    neovim
    wget
    neofetch 
    git
  ];

  
  # Excluded Packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
    gwenview
    okular
    plasma-browser-integration
    konsole
    oxygen
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false; # Or disable the firewall altogether.


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
