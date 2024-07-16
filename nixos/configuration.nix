{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix

      ./modules/bundle.nix

      ./packages.nix
    ];

  networking.hostName = "nixos"; 

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11"; 
  services.blueman.enable = true;
boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
     hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

}


