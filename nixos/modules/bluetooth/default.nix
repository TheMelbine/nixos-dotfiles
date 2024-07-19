{
  services.blueman.enable = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  hardware.bluetooth.enable = true; 
  hardware.bluetooth.powerOnBoot = true; 
}
