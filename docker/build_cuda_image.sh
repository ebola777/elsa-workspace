#!/bin/bash
# Build CUDA image for ELSA lab
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
IMAGE_NAME=cuda-drl

# The repository name for exporting
REPO_NAME=cuda-drl

################################################################################
# Set up the workspace
################################################################################
# Get the directory in which this script is located
# Reference: https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the current working directory
WORKING_DIR="$PWD"

################################################################################
# Check whether the image exists
# Reference: https://stackoverflow.com/a/30543453
################################################################################
if [[ ! "$(docker images --quiet $IMAGE_NAME 2> /dev/null)" == "" ]]
then
	echo "The image $IMAGE_NAME already exists"
	return 1
fi

################################################################################
# Build the new image
################################################################################
# Go to the build directory
cd "$SCRIPT_DIR/cuda-drl"

# Build the image
docker build --tag="$IMAGE_NAME" .

# Export the repository name
export REPO_NAME="$REPO_NAME"

################################################################################
# Clean up
################################################################################
# Go back to the original working directory
cd "$WORKING_DIR"