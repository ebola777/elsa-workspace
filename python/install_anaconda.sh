#!/bin/bash
# Install Anaconda

################################################################################
# Set up the workspace
################################################################################
# Specify the binary directory
BIN_DIR="$HOME/bin"

# Create the binary directory for executables
mkdir -p "$BIN_DIR"

################################################################################
# Specify the constants
################################################################################
# The installation directory
INSTALL_DIR="$HOME/anaconda3"

# Anaconda download URL
ANACONDA_DOWNLOAD_URL='https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh'

# The Anaconda script name
ANACONDA_INSTALL_NAME='Anaconda3-5.0.1-Linux-x86_64.sh'

################################################################################
# Install Anaconda
# References:
# https://www.anaconda.com/download/#linux
# https://conda.io/docs/user-guide/install/linux.html
################################################################################
# Specify the download location
DOWNLOAD_PATH="$BIN_DIR/$ANACONDA_INSTALL_NAME"

# Download the installation script
wget -O "$DOWNLOAD_PATH" "$ANACONDA_DOWNLOAD_URL"

# Install Anaconda
bash "$DOWNLOAD_PATH" -b -p "$INSTALL_DIR"

# Remove the installation script
rm "$DOWNLOAD_PATH"