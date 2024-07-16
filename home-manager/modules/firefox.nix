
{inputs, pkgs, ...}: {
    nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
   programs.firefox = {
   enable = true;
    profiles.melbine = {
   extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
     bitwarden
     ublock-origin 
     sponsorblock
   ];
      };
     };
}
