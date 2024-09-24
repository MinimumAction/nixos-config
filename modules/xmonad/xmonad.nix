# xmonad.nix
# xmonad desktop environment

{ pkgs, ... }: {

  # Xserver services
  services.xserver = {

    # Enable Xserver
    enable = true;

    # Enable Xmonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      # config = builtins.readFile ./xmonad.hs;
    };

  };

  # Display manager
  services.displayManager.defaultSession = "none+xmonad";

  # Excluded packages from desktop environment
  # environment.xfce.excludePackages = with pkgs; [];

  # XFCE specific programs
  environment.systemPackages = with pkgs; [];

}
