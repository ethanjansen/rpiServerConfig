#!/bin/bash

# For file loop
shopt -s nullglob

# VARS
DROPBOXUPLOADER="/opt/raspirunner/dropbox_uploader.sh"
COMMAND_DIR="/Raspi_Commands"

# loop forever
while true; do
  # wait
  sleep 1

  # download
  "$DROPBOXUPLOADER" -q download "$COMMAND_DIR" /

  # execute file loop
  for file in "$COMMAND_DIR"/*; do
    # Check for missing and get name
    if [ ! -f "$file" ]; then
      echo "ERROR: $file missing or directory" >&2
    fi
    filename="$(basename "$file")"

    # Execute
    chmod +x "$file"
    "$file" > /dev/null 2>&1

    # Remove
    rm "$file"
    "$DROPBOXUPLOADER" delete "$COMMAND_DIR/$filename"
  done
done
