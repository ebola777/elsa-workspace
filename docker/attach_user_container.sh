#!/bin/bash
# Attach the user container
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# The container name
CONTAINER_NAME="$(whoami)/$REPO_NAME/$TAG"

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
# Attach the container
################################################################################
docker start -a -i "$CONTAINER_NAME"