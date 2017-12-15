#!/bin/bash
# Build CUDA image for ELSA lab
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
IMAGE_NAME=elsa/cuda

# The tag of nvidia/cuda
TAG=9.0-cudnn7-devel

# The base name used for derived images
BASE_NAME=cuda

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
cd "$SCRIPT_DIR/cuda"

# Build the image
docker build --tag="$IMAGE_NAME" \
	--build-arg TAG="$TAG" .

# Export the base name
export BASE_NAME="$BASE_NAME"

################################################################################
# Clean up
################################################################################
# Go back to the original working directory
cd "$WORKING_DIR"