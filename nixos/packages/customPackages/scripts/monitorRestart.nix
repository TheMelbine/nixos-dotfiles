{ pkgs }:

pkgs.writeScriptBin "monitor-restart" ''
  #!${pkgs.bash}/bin/bash

  usage() {
    echo "Usage: $0 -d DIRECTORY -p PROGRAM [-r]"
    echo "  -d DIRECTORY  : Директория для мониторинга"
    echo "  -p PROGRAM    : Программа для перезапуска с её флагами"
    echo "  -r            : Рекурсивный мониторинг директорий"
    exit 1
  }

  WATCH_DIR=""
  PROGRAM=""
  RECURSIVE=false

  while getopts "d:p:r" opt; do
    case $opt in
        d) WATCH_DIR="$OPTARG" ;;
        p) PROGRAM="$OPTARG" ;;
        r) RECURSIVE=true ;;
        *) usage ;;
    esac
  done

  if [ -z "$WATCH_DIR" ] || [ -z "$PROGRAM" ]; then
    usage
  fi

  INOTIFY_OPTIONS="-e modify,create,delete,move"
  if $RECURSIVE; then
    INOTIFY_OPTIONS="$INOTIFY_OPTIONS -r"
  fi

  PROGRAM_NAME=$(echo "$PROGRAM" | awk '{print $1}')

  reload_program() {
    echo "Restarting program: $PROGRAM"
    pkill -15 "$PROGRAM_NAME"
    eval "$PROGRAM &"
  }

  while true; do
    inotifywait $INOTIFY_OPTIONS "$WATCH_DIR"
    reload_program
  done
''

