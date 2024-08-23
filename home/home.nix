{ config, pkgs, ... }:

{
  # Set username and directory
  home.username = "minimumaction";
  home.homeDirectory = "/home/minimumaction";


  # Packages
  home.packages = with pkgs; [];


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
  };
  

  # Enable self management
  programs.home-manager.enable = true;


  # DO NOT CHANGE
  home.stateVersion = "24.05";

}