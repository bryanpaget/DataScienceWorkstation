#!/usr/bin/env bash

# Install AMD graphics card stuff for deep learning.

# Sources of information on ROCm:

# https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#ubuntu
# https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/develop-upstream/rocm_docs/tensorflow-install-basic.md
# https://www.amd.com/en/graphics/servers-solutions-rocm-ml
# https://github.com/ROCmSoftwarePlatform
# https://github.com/ROCmSoftwarePlatform/pytorch
# https://hub.docker.com/r/rocm/pytorch
# https://hub.docker.com/r/rocm/tensorflow




# Command to run ROCm PyTorch container:

# docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G rocm/pytorch:latest


# Here's the recommended command to launch the TF2.3 docker image:
# 
# alias drun='sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx'
# 
# drun rocm/tensorflow



# First we install ROCm:

echo "Installing AMD ROCm and deep learning packages."

cd ~/Downloads

wget -q -O - http://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add -
echo 'deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main' | sudo tee /etc/apt/sources.list.d/rocm.list

wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
sudo sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'

sudo apt-get update

sudo apt-get install -y --allow-unauthenticated \
    hsa-ext-rocr-dev \
    hsa-rocr-dev \
    hsakmt-roct-dev \
    intel-mkl-64bit-2018.2-046 \
    libnuma-dev \
    rccl \
    rocm-dev \
    rocm-device-libs \
    rocm-dkms \
    rocm-libs \
    rocm-opencl \
    rocm-opencl-dev \
    rocm-utils

# Add $USER to video and render so we have access to ROCm:
sudo usermod -a -G video $USER
sudo usermod -a -G render $USER

# Make it so all new users are automatically added to the required groups:
echo 'ADD_EXTRA_GROUPS=1'  | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=video'  | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=render' | sudo tee -a /etc/adduser.conf

echo 'export PATH=$PATH:/opt/rocm/bin:/opt/rocm/profiler/bin:/opt/rocm/opencl/bin' | sudo tee -a /etc/profile.d/rocm.sh

pip3 install tensorflow-rocm-enhanced

sudo docker pull rocm/tensorflow
sudo docker pull rocm/pytorch
