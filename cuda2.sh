#!/bin/bash

# Stop on the first error
set -e

# 1. Remove the previous versions of NVIDIA packages
sudo apt-get purge nvidia-cuda-toolkit
sudo apt-get purge nvidia-*

# 2. Install required packages for potential CUDA dependencies
sudo apt-get update
sudo apt-get install -y build-essential dkms
sudo apt-get install -y freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# 3. Get the keyring and set up the CUDA repository
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

# 4. Install CUDA 12.1
sudo apt-get -y install cuda-12-1

# 5. Set up the environment variables
echo "# Set CUDA environment" >> ~/.bashrc
echo "export PATH=/usr/local/cuda-12.1/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc

# 6. Check the installation
nvidia-smi
nvcc --version

echo "CUDA 12.1 installation is complete."

