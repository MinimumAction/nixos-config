{ config, pkgs, ... }:

{

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

  # Emacs
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
  
  # Packages
  home.packages = with pkgs; [];

}
