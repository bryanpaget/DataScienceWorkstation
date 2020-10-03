#!/usr/bin/env bash

# Install NVIDIA Stuff:

flatpak install -y com.leinardi.gwe                # Green With Envy, NVIDIA control panel

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

# These are the instructions I followed to get CUDA working with Tensorflow and PyTorch
# https://askubuntu.com/questions/1230645/when-is-cuda-gonna-be-released-for-ubuntu-20-04

sudo apt-get install --no-install-recommends nvidia-driver-450

sudo apt-get install --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.5.32-1+cuda10.1  \
    libcudnn7-dev=7.6.5.32-1+cuda10.1




# ML Workspace with NVIDIA Support:

docker run -p 8080:8080 --gpus all mltooling/ml-workspace-gpu:latest

# PyTorch

pip3 install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
