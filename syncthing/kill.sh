#!/bin/bash
# Kill Syncthing

################################################################################
# Kill Syncthing
################################################################################
# Kill the tmux session
# Reference: Reference: https://askubuntu.com/a/868194
tmux kill-session -t syncthing

# Kill the syncthing process
# Reference: https://stackoverflow.com/a/160926
pkill syncthing