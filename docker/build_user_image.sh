#!/bin/bash
# Build user image
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
IMAGE_NAME="$(whoami)/$REPO_NAME:$TAG"

# The user name
USERNAME="$(whoami)"

# The password
PASSWORD="docker"

################################################################################
# Set up the workspace
################################################################################
# Get the directory in which this script is located
# Reference: https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the current working directory
WORKING_DIR="$PWD"

################################################################################
# Check the environment variables
# Reference: https://stackoverflow.com/a/307540
################################################################################
# Check the hub user
if [ -z "$HUB_USER" ]
then
	echo '$HUB_USER should be set'
	exit 1
fi

# Check the repository name
if [ -z "$REPO_NAME" ]
then
	echo '$REPO_NAME should be set'
	exit 1
fi

# Check the tag
if [ -z "$TAG" ]
then
	echo '$TAG should be set'
	exit 1
fi

################################################################################
# Check whether the image exists
# Reference: https://stackoverflow.com/a/30543453
################################################################################
if [[ ! "$(docker images --quiet $IMAGE_NAME 2> /dev/null)" == "" ]]
then
	echo "The image $IMAGE_NAME already exists"
	exit 1
fi

################################################################################
# Build the new image
################################################################################
# Go to the build directory
cd "$SCRIPT_DIR/user"

# Build the image
docker build --tag="$IMAGE_NAME" \
	--build-arg HUB_USER="$HUB_USER" \
	--build-arg REPO_NAME="$REPO_NAME" \
	--build-arg TAG="$TAG" \
	--build-arg USERNAME="$USERNAME" \
	--build-arg PASSWORD="$PASSWORD" \
	--build-arg UID="$(id -u)" .

################################################################################
# Clean up
################################################################################
# Go back to the original working directory
cd "$WORKING_DIR"