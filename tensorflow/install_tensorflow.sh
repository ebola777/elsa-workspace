#!/bin/bash
# Install TensorFlow
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Ensure running as root
# Reference: https://unix.stackexchange.com/a/173770
################################################################################
if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

################################################################################
# Set up the workspace
################################################################################
# Get the current working directory
WORKING_DIR="$PWD"

# Specify the binary directory
BIN_DIR="$HOME/bin"

# Create the binary directory for executables
mkdir -p "$BIN_DIR"

################################################################################
# Specify the constants
################################################################################
# TensorFlow binary URL
TF_BINARY_URL='https://github.com/mind/wheels/releases/download/tf1.4.1-gpu-cuda9/tensorflow-1.4.1-cp36-cp36m-linux_x86_64.whl'

################################################################################
# Install MKL
# Reference: https://github.com/mind/wheels#mkl
################################################################################
# Go to the binary directory
cd "$BIN_DIR"

# Install MKL
git clone https://github.com/01org/mkl-dnn.git
cd mkl-dnn/scripts && ./prepare_mkl.sh && cd ..
mkdir -p build && cd build && cmake .. && make
sudo make install

# Remove the local MKL repository
cd "$BIN_DIR"
rm -rf mkl-dnn

################################################################################
# Install TensorFlow
# Reference: https://www.tensorflow.org/install/install_linux
################################################################################
# Create a conda environment
conda create --yes --name tensorflow python=3.6

# Activate the conda environment
source activate tensorflow

# Install TensorFlow
pip install --ignore-installed --upgrade "$TF_BINARY_URL"

################################################################################
# Clean up
################################################################################
# Go back to the original working directory
cd "$WORKING_DIR"