#!/bin/bash
# Get config path from rclone
config=$(rclone config file)
# Remove everything except the path
RCLONE_CONFIG="/${config#*/}"
export RCLONE_CONFIG

source $HOME/.local/bin/.ENV

# Exit if rclone running
if [[ "$(pidof -x $(basename $0) -o %PPID)" ]]; then exit; fi

# Sync files to the cloud
/usr/bin/rclone sync $KEEPASS_FILE my-drive:/ --verbose --progress
