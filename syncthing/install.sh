#!/bin/bash
# Install Syncthing

################################################################################
# Install packages for accessing metadata and packages over https
# Reference: https://apt.syncthing.net/
################################################################################
sudo apt-get install -y apt-transport-https

################################################################################
# Install Syncthing
# Reference: https://apt.syncthing.net/
################################################################################
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get -y install syncthing