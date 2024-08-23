# live.nix

{ pkgs, ... }: {

  # Drivers for external wifi adapter
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
  boot.initrd.kernelModules = [ "8812au" ];

  # Lis usb specific system packages
  environment.systemPackages = with pkgs; [];

}