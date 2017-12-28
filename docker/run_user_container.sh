#!/bin/bash
# Run the user container
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
IMAGE_NAME="$(whoami)/$REPO_NAME:$TAG"

# The container name
CONTAINER_NAME="$(whoami).$REPO_NAME.$TAG"

################################################################################
# Check the environment variables
# Reference: https://stackoverflow.com/a/307540
################################################################################
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
# Check whether the container exists
################################################################################
if [ "$(docker ps --quiet --filter name=$CONTAINER_NAME)" ]
then
	echo "The container $CONTAINER_NAME already exists"
	exit 1
fi

################################################################################
# Run the container
################################################################################
docker run \
	--env CONTAINER_REPO_NAME="$REPO_NAME" \
	--env CONTAINER_TAG="$TAG" \
	--env="DISPLAY" \
	--name="$CONTAINER_NAME" \
	--net=host \
	--pid=host \
	--runtime=nvidia \
	--volume=$HOME:$HOME \
	--workdir=$HOME \
	-it \
	"$IMAGE_NAME"