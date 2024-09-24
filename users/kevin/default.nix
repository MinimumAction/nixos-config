{ inputs, config, lib, pkgs, ... }: {

  # Imports
  imports = [
    ./programs/rofi/default.nix # import rofi config
  ];

  # User
  users.kevin = {
    isNormalUser = true;
    home = "/home/kevin";
    # hashedPassword = config.modules.secrets.kevinHashedPassword;
    shell = pkgs.zsh;
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
      "wireshark"
    ];
  };


  home-manager.users.kevin = {
  };
  
  # DO NOT CHANGE
  home.stateVersion = "24.05";
  
  # Set username and directory
  home.username = "minimumaction";
  home.homeDirectory = "/home/minimumaction";

  # Enable self management
  programs.home-manager.enable = true;

  # Zsh shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Git
  programs.git = {
    enable = true;
    userName = "MinimumAction";
    userEmail = "liguori.km@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
  
  # Packages
  home.packages = with pkgs; [];

}