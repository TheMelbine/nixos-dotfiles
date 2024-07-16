{ config, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./packages/packages.nix
    ];
 
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11"; 
}


