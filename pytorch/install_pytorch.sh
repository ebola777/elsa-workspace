#!/bin/bash
# Install PyTorch
# Reference: https://hackmd.io/s/BJFt7Hp-M

################################################################################
# Install PyTorch
# Reference: http://pytorch.org/
################################################################################
# Create a conda environment
conda create --yes --name pytorch python=3.6

# Activate the conda environment
source activate pytorch

# Install PyTorch
conda install --yes pytorch torchvision cuda90 -c pytorch