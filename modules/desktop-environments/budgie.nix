# budgie.nix
# budgie desktop environment

{ pkgs, ... }: {

  # Windowing and desktop environment
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Excluded packages from desktop environment
  environment.budgie.excludePackages = with pkgs; [
    vlc
    mate.mate-terminal
  ];

  # Budgie specific programs
  environment.systemPackages = with pkgs; [];

}
