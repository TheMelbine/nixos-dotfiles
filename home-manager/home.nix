{ config, pkgs, inputs, ... }:

{

  imports = [
        ./modules/bundle.nix
  ];



  home.username = "melbine";
#  home.homeDirectory = "/home/melbine";


  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
