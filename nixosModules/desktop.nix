# desktop.nix

{ pkgs, ... }: {

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Printing
  services.printing.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Desktop specific system packages
  environment.systemPackages = with pkgs; [
    mpv
    lxqt.qterminal
    vscode
    tokyonight-gtk-theme
    anki-bin
  ];

}