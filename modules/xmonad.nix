# xmonad.nix
# xmonad desktop environment

{ pkgs, ... }: {

  # Imports 
  imports =[
    ./graphical.nix # graphical environment
  ];

  # Windowing and desktop environment
  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages : [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
      };
    };
    displayManager.defaultSession = "xfce+xmonad";
  };

  # Excluded packages from desktop environment
  # environment.xfce.excludePackages = with pkgs; [];

  # XFCE specific programs
  environment.systemPackages = with pkgs; [];

}
