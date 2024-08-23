# defaults.nix

{ pkgs, ... }: {

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Default system packages
  environment.systemPackages = with pkgs; [
    vim 
    neovim
    git
    neofetch 
    pciutils
    wget
    parted
  ];

}