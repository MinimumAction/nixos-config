# budgie-env.nix

{ pkgs, ... }: {

  # Windowing and desktop
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };


  # Excluded Packages
  environment.budgie.excludePackages = with pkgs; [
    vlc
    mate.mate-terminal
  ];

}