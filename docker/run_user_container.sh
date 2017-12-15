#!/bin/bash
# Run the user container
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The image name
CONTAINER_NAME="$(whoami)"

################################################################################
# Check the base name
# Reference: https://stackoverflow.com/a/307540
################################################################################
if [ -z "$BASE_NAME" ]
then
	echo '$BASE_NAME should be set'
	exit 1
fi

################################################################################
# Check whether the container exists
################################################################################
if [ "$(docker ps --quiet --filter name=$CONTAINER_NAME)" ]
	echo "The container $CONTAINER_NAME already exists"
	exit 1
then
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
	"$(whoami)/cuda"