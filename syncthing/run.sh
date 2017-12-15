#!/bin/bash
# Run Syncthing

################################################################################
# Run Syncthing
# Reference: https://stackoverflow.com/a/39487734
################################################################################
tmux new-session -d -s syncthing 'syncthing'