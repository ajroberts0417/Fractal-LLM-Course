#!/bin/bash

# Stop on the first error
set -e

# 1. Remove the previous versions of NVIDIA packages
sudo apt-get purge nvidia-cuda-toolkit
sudo apt-get purge nvidia-*

# 2. Install required packages
sudo apt-get update
sudo apt-get install -y build-essential dkms
sudo apt-get install -y freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# 3. Install the CUDA Toolkit
# You may want to check for the latest version from the official NVIDIA website.

CUDA_REPO_PKG="cuda-repo-ubuntu2004-12-1-local_12.1.0-455.23.05-1_amd64.deb"
wget -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y cuda

# 4. Set up the environment variables
echo "# Set CUDA environment" >> ~/.bashrc
echo "export PATH=/usr/local/cuda-12.1/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
source ~/.bashrc

# 5. Check the installation
nvidia-smi
nvcc --version

echo "CUDA 12.1 installation is complete."

