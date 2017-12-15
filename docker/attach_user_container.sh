#!/bin/bash
# Attach the user container
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
CONTAINER_NAME="$(whoami)"

################################################################################
# Attach the container
################################################################################
docker start -a -i "$CONTAINER_NAME"