# overlays/ags.nix
{ pkgs }:

pkgs.ags.overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs ++ [ pkgs.libdbusmenu-gtk3 ];
})

