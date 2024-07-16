{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.wrapGAppsHook
  ];

  buildInputs = [
    pkgs.glib
    pkgs.gtk3
    pkgs.dconf
    pkgs.gsettings-desktop-schemas
    pkgs.glib-networking
  ];

  shellHook = ''
    export XDG_DATA_DIRS=$GSETTINGS_SCHEMAS_PATH/share:$XDG_DATA_DIRS
    export GSETTINGS_SCHEMA_DIR=$GSETTINGS_SCHEMAS_PATH/share/glib-2.0/schemas
  '';
}

