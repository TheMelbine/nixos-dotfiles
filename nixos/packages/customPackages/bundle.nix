{ pkgs }:

let
  nerdFontsSymbols = import ./fonts/nerd-fonts-symbols.nix { inherit (pkgs) stdenv fetchzip lib; };
  toggleScript = import ./scripts/toggle.nix { inherit pkgs; };
in
  {
    inherit nerdFontsSymbols toggleScript;
  }

