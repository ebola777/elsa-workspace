#!/bin/bash
# Build user image
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The organization
ORG_NAME=shawnchang420

# The image name
IMAGE_NAME="$(whoami)/$BASE_NAME"

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
# Check the organization name
if [ -z "$ORG_NAME" ]
then
	echo '$ORG_NAME should be set'
	exit 1
fi

# Check the base name
if [ -z "$BASE_NAME" ]
then
	echo '$BASE_NAME should be set'
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
	--build-arg ORG_NAME="$ORG_NAME" \
	--build-arg BASE_NAME="$BASE_NAME" \
	--build-arg USERNAME="$USERNAME" \
	--build-arg PASSWORD="$PASSWORD" \
	--build-arg UID="$(id -u)" .

################################################################################
# Clean up
################################################################################
# Go back to the original working directory
cd "$WORKING_DIR"