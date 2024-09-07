# graphical-xfce.nix
# desktop environment & graphical programs

{ pkgs, ... }: {

  # Windowing and desktop environment
  services = {
    displayManager.defaultSession = "xfce";
    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      desktopManager.xterm.enable = false;
    };
  };

  # Excluded packages from desktop environment
  # environment.xfce.excludePackages = with pkgs; [];

  # Graphical specific programs
  environment.systemPackages = with pkgs; [
    
    # programs
    kitty
    vscode
    
    # themes
    tokyonight-gtk-theme

  ];

  # Firefox browser
  programs.firefox.enable = true;

}
