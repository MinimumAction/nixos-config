# budgie-env.nix

{ pkgs, ... }: {

  # Windowing and desktop
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

}