#!/bin/bash
# Install TensorFlow
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Specify the constants
################################################################################
# TensorFlow binary URL
TF_BINARY_URL='https://github.com/mind/wheels/releases/download/tf1.4.1-gpu-cuda9/tensorflow-1.4.1-cp36-cp36m-linux_x86_64.whl'

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