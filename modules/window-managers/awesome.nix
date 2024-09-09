# awesome.nix
# awesome desktop environment

{ pkgs, ... }: {

  # Imports 
  imports =[
    ./graphical.nix # graphical environment
  ];

  # Windowing and desktop environment
  services = {
    xserver = {
      enable = true;
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
      };
    };
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };
  };

  # Excluded packages from desktop environment
  # environment.awesome.excludePackages = with pkgs; [];

  # Awesome specific programs
  environment.systemPackages = with pkgs; [];

}
