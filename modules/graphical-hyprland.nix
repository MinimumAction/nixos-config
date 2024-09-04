# graphical-hyprland.nix
# desktop environment & graphical programs

{ pkgs, ... }: {

  # Windowing and desktop environment
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb.layout = "us";
    xkb.variant = "mac";
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Portal?
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Waybar
  programs.waybar.enable = true;

  # Graphical specific programs
  environment.systemPackages = with pkgs; [
    
    # programs
    mpv
    vscode

    # applets/useful tools
    networkmanagerapplet
    pavucontrol
    wlogout
    hyprpaper

    # notification daemon
    dunst
    libnotify

    # swww?
    swww

    # Rofi?
    rofi-wayland
    
    # themes
    tokyonight-gtk-theme

  ];

  # Firefox browser
  programs.firefox.enable = true;

  # File manager
  programs.thunar.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

}
