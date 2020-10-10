#!/usr/bin/env bash

# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-repo-ubuntu2004_10.1.243-1_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu2004_10.1.243-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb

sudo apt-get update

# Install NVIDIA driver
sudo apt-get install --no-install-recommends nvidia-driver-450

# Install development and runtime libraries (~4GB)
sudo apt-get install --no-install-recommends \
  cuda-10-1 \
  libcudnn7=7.6.5.32-1+cuda10.1  \
  libcudnn7-dev=7.6.5.32-1+cuda10.1
  libnvinfer6=6.0.1-1+cuda10.1 \
  libnvinfer-dev=6.0.1-1+cuda10.1 \
  libnvinfer-plugin6=6.0.1-1+cuda10.1

# NVIDIA Docker

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -

distribution=$(. /etc/os-release; echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -

  sudo apt-get install -y nvidia-container-toolkitA

# ML Workspace with NVIDIA Support:

docker run -p 8080:8080 --gpus all mltooling/ml-workspace-gpu:latest

# PyTorch

pip3 install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html

# Install NVIDIA Stuff:

flatpak install -y com.leinardi.gwe                # Green With Envy, NVIDIA control panel
