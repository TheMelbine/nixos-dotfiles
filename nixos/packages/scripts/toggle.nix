{ pkgs }:

pkgs.writeScriptBin "toggle" ''
  #!/usr/bin/env bash

  if [ -z "$1" ]; then
    echo "Usage: $0 <process_name> [arguments...]"
    exit 1
  fi

  pkill -15 "$1" || "$@" &
''

