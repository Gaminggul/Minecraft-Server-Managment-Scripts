#!/bin/bash

# Minecraft manager script (mc)
# Manage Minecraft servers in screen sessions.
# Usage: mc <command> [servername]
# Author: Noel Janzen
# 30.12.2025

# Base folder
BASE_DIR="YOUR_MINECRAFT_BASE_DIR" # <-- EDIT!
SESSION_PREFIX="mc-"

# Java & RAM settings
JAVA="java"
MIN_MEM="8G"
MAX_MEM="12G"
# Standard-JAR-Name
JAR_NAME="server.jar"

# Terminal Output
usage() {
  echo "Usage:"
  echo "  mc start <servername>   - Start Server"
  echo "  mc stop <servername>    - Stop Server"
  echo "  mc attach <servername>  - Attach Screen-Session"
  echo "  mc list                 - Show running MC-Sessions"
  echo "  mc servers              - Show available Server-Folder"
  exit 1
}

# List available server folders
list_servers() {
  echo "Available Server (Folder in ${BASE_DIR}):"
  for d in "$BASE_DIR"/*/; do
    [ -d "$d" ] || continue
    echo "  - $(basename "$d")"
  done
}

if [ $# -lt 1 ]; then
  usage
fi

CMD="$1"
NAME="$2"
SESSION="${SESSION_PREFIX}${NAME}"
DIR="${BASE_DIR}/${NAME}"

# Handle commands
case "$CMD" in
start)
  if [ -z "$NAME" ]; then
    echo "Error: No Servername entert."
    list_servers
    exit 1
  fi

  if [ ! -d "$DIR" ]; then
    echo "Error: Serverordner '${DIR}' doesn't exist."
    list_servers
    exit 1
  fi

  # JAR-File
  JAR_PATH="${DIR}/${JAR_NAME}"
  if [ ! -f "$JAR_PATH" ]; then
    # If server.jar doesn't existst → first .jar-File in folder
    JAR_PATH="$(ls "$DIR"/*.jar 2>/dev/null | head -n1)"
  fi

  if [ -z "$JAR_PATH" ] || [ ! -f "$JAR_PATH" ]; then
    echo "Error: No JAR-File in ${DIR} found."
    echo "Create a server.jar or rename the Jar-File."
    exit 1
  fi

  echo "Start Server '${NAME}' with JAR: $(basename "$JAR_PATH") in Screen-Session '${SESSION}'..."
  screen -dmS "$SESSION" bash -c "cd \"$DIR\" && $JAVA -Xms$MIN_MEM -Xmx$MAX_MEM -jar \"$JAR_PATH\" nogui"
  ;;

stop)
  if [ -z "$NAME" ]; then
    echo "Error: No Servername entered."
    list_servers
    exit 1
  fi
  echo "Send 'stop' to Server '${NAME}' (Session ${SESSION})..."
  screen -S "$SESSION" -p 0 -X stuff "stop^M"
  ;;

attach)
  if [ -z "$NAME" ]; then
    echo "Error: No Servername entered."
    list_servers
    exit 1
  fi
  echo "Attach to '${SESSION}'..."
  screen -r "$SESSION"
  ;;

list)
  echo "Running Minecraft-Sessions:"
  screen -ls | grep "$SESSION_PREFIX" || echo "No running sessions found."
  ;;

servers)
  list_servers
  ;;

*)
  usage
  ;;
esac
