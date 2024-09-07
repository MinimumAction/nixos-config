# xfce.nix
# xfce desktop environment

{ pkgs, ... }: {

  # Imports 
  imports =[
    ./graphical.nix # graphical environment
  ];

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

  # XFCE specific programs
  environment.systemPackages = with pkgs; [];

}
