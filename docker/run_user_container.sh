#!/bin/bash
# Run the user container
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
CONTAINER_NAME="$(whoami)/$BASE_NAME"

################################################################################
# Check the environment variables
# Reference: https://stackoverflow.com/a/307540
################################################################################
# Check the base name
if [ -z "$BASE_NAME" ]
then
	echo '$BASE_NAME should be set'
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
	--env CONTAINER_BASE_NAME="$BASE_NAME" \
	--env="DISPLAY" \
	--name="$CONTAINER_NAME" \
	--net=host \
	--pid=host \
	--runtime=nvidia \
	--volume=$HOME:$HOME \
	--workdir=$HOME \
	-it \
	"$(whoami)/$BASE_NAME"