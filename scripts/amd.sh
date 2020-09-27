#!/usr/bin/env bash

# Install AMD graphics card stuff for deep learning.

sudo apt update && sudo apt upgrade -y  # Ubuntu/Debian Mantra

# Install ROCm for AMD graphics cards:
# https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#ubuntu

# Tensorflow for ROCm:
# https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/develop-upstream/rocm_docs/tensorflow-install-basic.md

# More ROCm stuff:

# https://www.amd.com/en/graphics/servers-solutions-rocm-ml
# https://github.com/ROCmSoftwarePlatform


# https://github.com/ROCmSoftwarePlatform/pytorch

# https://hub.docker.com/r/rocm/pytorch

# This repo host the docker images for PyTorch releases with ROCm backend support. To configure docker environment for ROCm, please refer to the following installation guide: https://github.com/RadeonOpenCompute/ROCm-docker/blob/master/quick-start.md
# 
# The docker images been hosted in this registry will run on gfx803 (FIJI, Polaris GPUs), gfx900(Vega10-type GPU - MI25, Vega56, Vega64) and gfx906 (Vega20-type GPU - MI50, MI60).
# 
# Commands to pull and run the latest PyTorch docker container: docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G rocm/pytorch:latest


sudo docker pull rocm/pytorch

# docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G rocm/pytorch:latest

# https://hub.docker.com/r/rocm/tensorflow

docker pull rocm/tensorflow

# This repo host the docker images for Tensorflow releases with ROCm backend support. To configure docker environment for ROCm, please refer to the following installation guide:
# 
# https://github.com/RadeonOpenCompute/ROCm-docker/blob/master/quick-start.md
# 
# The -dev docker containers have all dependencies to rebuild tensorflow-rocm from the source.
# 
# Here's the recommended command to launch the TF2.3 docker image:
# 
# alias drun='sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx'
# 
# drun rocm/tensorflow:latest
# 
# Images built after ROCm3.1 are based on Ubuntu 18.04, earlier images are based on Ubuntu 16.04 unless otherwise specified in the tag.




wget -q -O - http://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add -
echo 'deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main' | sudo tee /etc/apt/sources.list.d/rocm.list

sudo apt install rocm-dkms && sudo reboot

sudo apt-get update && \
    sudo apt-get install -y --allow-unauthenticated \
    libnuma-dev
    rocm-dkms rocm-dev rocm-libs rccl \
    rocm-device-libs \
    hsa-ext-rocr-dev hsakmt-roct-dev hsa-rocr-dev \
    rocm-opencl rocm-opencl-dev \
    rocm-utils 


# Add user to video and render so we have access to ROCm stuff.
sudo usermod -a -G video $LOGNAME
sudo usermod -a -G render $LOGNAME

# Make it so all new users are automatically added to the required groups:
echo 'ADD_EXTRA_GROUPS=1' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=video' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=render' | sudo tee -a /etc/adduser.conf

cd ~/Downloads

# Some Intel thing required by ROCm
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB

sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB

sudo sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'

sudo apt-get update

sudo apt-get install \

sudo apt-get install -y --allow-unauthenticated
    rocm-dkms \
    rocm-dev \
    rocm-libs \
    rccl \
    rocm-device-libs \
    hsa-ext-rocr-dev \
    hsakmt-roct-dev \
    hsa-rocr-dev \
    intel-mkl-64bit-2018.2-046 \
    rocm-opencl \
    rocm-opencl-dev \
    rocm-utils

echo 'export PATH=$PATH:/opt/rocm/bin:/opt/rocm/profiler/bin:/opt/rocm/opencl/bin' | sudo tee -a /etc/profile.d/rocm.sh

pip3 install tensorflow-rocm-enhanced