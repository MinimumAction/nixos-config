# graphical.nix
# desktop environment & graphical programs

{ pkgs, ... }: {

  # Windowing and desktop environment
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Excluded packages from desktop environment
  environment.budgie.excludePackages = with pkgs; [
    vlc
    mate.mate-terminal
  ];

  # Graphical specific programs
  environment.systemPackages = with pkgs; [
    
    # programs
    lxqt.qterminal
    mpv
    vscode
    
    # themes
    tokyonight-gtk-theme

  ];

  # Firefox browser
  programs.firefox.enable = true;

}
