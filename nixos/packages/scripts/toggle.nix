{ stdenv, writeScriptBin }:

let
  toggleScript = writeScriptBin "toggle_process" ''
    #!/usr/bin/env bash

    if [ -z "$1" ]; then
      echo "Usage: $0 <process_name> [arguments...]"
      exit 1
    fi

    pkill -15 "$1" || "$@" &
  '';
in
  stdenv.mkDerivation {
    name = "toggle-scripts";
    version = "1.0.0";

    buildInputs = [];

    installPhase = ''
      mkdir -p $out/bin
      cp ${toggleScript} $out/bin/toggle_process
    '';
  }

