{ inputs, config, lib, pkgs, ... }: {

  # Imports
  imports = [];

  # User
  users.kevin = {
    isNormalUser = true; # Normal user
    home = "/home/kevin"; # Home directory
    shell = pkgs.zsh; # Shell
    extraGroups = [ "networkmanager" "wheel" ]; # Groups

    # User packages
    packages = with pkgs; [

    ];
    
  };

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
  
}