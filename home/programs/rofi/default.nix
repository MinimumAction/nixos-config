# rofi default.nix

{ pkgs, ... }:{
  
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    #theme = ./theme.rafi;
  };
}