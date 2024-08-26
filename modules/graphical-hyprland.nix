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

  # Waybar
  programs.waybar.enable = true;

  # Graphical specific programs
  environment.systemPackages = with pkgs; [
    
    # programs
    kitty
    lxqt.qterminal
    mpv
    vscode
    
    # themes
    tokyonight-gtk-theme

  ];

  # Firefox browser
  programs.firefox.enable = true;

}
