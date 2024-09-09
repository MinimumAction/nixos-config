# xmonad.nix
# xmonad desktop environment

{ pkgs, ... }: {

  # Xserver services
  services.xserver = {

    # Enable Xserver
    enable = true;

    # Desktop manager   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    # Window manager
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
      };
    };

  };

  # Display manager
  services.displayManager.defaultSession = "xfce+xmonad";

  # Excluded packages from desktop environment
  # environment.xfce.excludePackages = with pkgs; [];

  # XFCE specific programs
  environment.systemPackages = with pkgs; [];

}
