{ pkgs, ... }:{

  xmonad = {
    
    enable = true;
    
    enableContribAndExtras = true;
    
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.xmonad
    ];

    config = ./config.hs;

  };

}