# graphical.nix
# graphical programs for every DE

{ pkgs, ... }: {

  # Graphical specific programs
  environment.systemPackages = with pkgs; [
    
    # programs
    kitty
    mpv
    vscode
    
    # themes
    tokyonight-gtk-theme

  ];

  # Firefox browser
  programs.firefox.enable = true;

}
