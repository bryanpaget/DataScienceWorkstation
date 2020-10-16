#!/usr/bin/env bash

# GNU Linux Data Science Workstation
#
# Use this on a fresh install of Ubuntu 20.04 to unlock the power of open
# source data science tools. 

# Step 0: update package list and packages. 
sudo apt update -y && sudo apt upgrade -y  

# Step 1: Essential packages:

function install_essential () {
	sudo apt install -y \
		apt-transport-https \
		apt-utils \
		build-essential \
		ca-certificates \
		clang \
		clang-format \
		clang-tidy \
		cmake \
		cmake-qt-gui \
		curl \
		deja-dup \
		flatpak \
		g++-multilib \
		gfortran \
		git \
		glances \
		gnome-software-plugin-flatpak \
		gnome-tweaks \
		gnupg-agent \
		htop \
		libboost-dev \
		libboost-filesystem-dev \
		libboost-program-options-dev \
		libboost-system-dev \
		libclang-10-dev \
		libclang-dev \
		libcurl4-openssl-dev \
		libelf-dev \
		libfftw3-dev \
		libncurses5-dev \
		libpthread-stubs0-dev \
		libssl-dev \
		libunwind-dev \
		nodejs \
		npm \
		pkg-config \
		python3-pip \
		ranger \
		rpm \
		software-properties-common \
		sqlitebrowser \
		ssh \
		tig \
		vim \
		visidata \
		wget
}

function install_julia () {
	sudo apt install -y julia
	julia ./scripts/ijulia.jl 
}

install_julia


# Step 2: Docker

function install_docker () {
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"
	sudo apt update
	sudo apt-get install -y \
		docker-ce \
		docker-ce-cli \
		containerd.io
	sudo usermod -aG docker $USER
}

install_docker

# Step 3: Graphics Card 

function install_gpu_driver () {
	if [ "$(sudo lspci | grep AMD)" ]; then
		echo "AMD card found."
		./scripts/amd.sh
	elif [ "$(sudo lspci | grep NVIDIA)" ]; then
		echo "NVIDI card found."
		./scripts/nvidia.sh
	else
		echo "No discrete graphics card detected."
	fi
}

install_gpu_driver

# Step 4: R


sudo apt install -y r-base

cd ~/Downloads
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb
sudo dpkg -i ./rstudio-1.3.1093-amd64.deb

R -e 'install.packages("languageserver")'

mkdir ~/R
R_LIBS_USER=~/R Rscript ./scripts/IRkernel.R

# Step 5: Jupyter Lab and Extensions.

# Todo: actually install jupyter-lsp properly. It does not work right now.
# https://github.com/krassowski/jupyterlab-lsp

function install_jupyter () {
	sudo apt install -y \
		jupyter \
		jupyter-core \
		jupyter-notebook \
	
	pip3 install --user \
		jupyter \
		jupyter-lab \
		jupyterlab-git \
		jupyter-lsp \
		matplotlib \
		python-language-server[all] \
		tensorflow \
		tfds-nightly \
		sas_kernel \
		bash_kernel
	
	python3 -m bash_kernel.install
	python3 -m jupyterlab build
}

install_jupyter

# Scala Kernel for Jupyter

function install_scala_kernel () {
	sudo apt install -y \
		openjdk-14-jre \
		openjdk-14-jdk \
		scala
	cd ~/Downloads
	curl -Lo coursier https://git.io/coursier-cli
	chmod u+x coursier
	./coursier launch --fork almond -- --install
	rm -f ./coursier
	cd -
}

install_scala_kernel

 
# Step 6: Flatpak

# Flatpaks are containerized packages and can update indepently of the base
# operating system (similar to snaps). I've included some flatpaks here because
# we want to stick with a solid base (Ubuntu 20.04) but we may want to use the latest
# version of a specific app. Flatpak and Snap make this a breeze.

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
	com.github.artemanufrij.regextester \
	com.github.calo001.fondo \
	com.github.junrrein.PDFSlicer \
	com.github.maoschanz.drawing \
	com.jetbrains.PyCharm-Community \
	com.microsoft.Teams \
	com.rafaelmardojai.Blanket \
	com.uploadedlobster.peek \
	com.gitlab.newsflash \
	net.codeindustry.MasterPDFEditor \
	nl.hjdskes.gcolor3 \
	org.cvfosammmm.Setzer \
	org.gabmus.whatip \
	org.glimpse_editor.Glimpse \
	org.gnome.Connections \
	org.gnome.Polari \
	org.gnome.Boxes \
	org.gnome.builder \
	org.gnome.calendar \
	org.gnome.documents \
	org.gnome.gitg \
	org.gnome.gitlab.somas.Apostrophe \
	org.gnome.gitlab.somas.Apostrophe.Plugin.TexLive \
	org.gnome.meld \
	org.gnome.todo \
	org.gustavoperedo.FontDownloader \
	org.inkscape.Inkscape \
	org.jamovi.jamovi \
	org.videolan.VLC \
	us.zoom.Zoom

# Step 6: Snaps
# Snaps are Canonical's containerized packages.

sudo snap install \
	brave \
	chromium \
	codium \
	dbeaver-ce \
	flameshot \
	onlyoffice-desktopeditors \
	slack \
	spotify \
	telegram-desktop \
	wps-office


# Step 7: Extra Packages

# Bash git prompt: show git information in the Bash prompt.

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

echo 'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then 
	GIT_PROMPT_ONLY_IN_REPO=1
	source $HOME/.bash-git-prompt/gitprompt.sh
fi' | tee -a ~/.bashrc 


# Doom Emacs

# Emacs is an extensible text editor.
#
# Doom Emacs which has the
# best out-of-the-box user experience. Doom Emacs is easy to configure.

# https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#configure

sudo apt install -y emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# Zeal: Offline Documentation!

# Useful for when you want something faster than Google or when you are offline.
# Many docsets can be found here: https://github.com/kapeli/feeds
# but the main way to install docsets is from the app itsself. I have included
# 2 docsets here to start. We can add more if we think they will be useful.

# A useful web-based alternative is: https://devdocs.io/

sudo apt install -y zeal

cd ~/.local/share/Zeal/Zeal/docsets/

wget http://singapore.kapeli.com/feeds/Python_3.tgz  # Python 3 documentation.
wget http://singapore.kapeli.com/feeds/Bash.tgz      # Bash documentation.

tar -zxvf ./Python_3.tgz
tar -zxvf ./Bash.tgz

rm ./Python_3.tgz ./Bash.tgz

cd ~/

# Set a nice wallpaper:

curl -L https://unsplash.com/photos/TkWfKC0Tb8g/download?force=true > ~/Pictures/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/wallpaper.jpg

# Clean up

sudo apt autoremove
sudo apt clean 
sudo apt autoclean


npm i bash-language-server
npm install vscode-html-languageserver-bin
npm install dockerfile-language-server-nodejs
npm install yaml-language-server


# stuff required by packrat:
sudo apt install -y \
	texlive \
	texlive-xetex \
	libfreetype6-dev \
	libxml2-dev \
	pandoc


function install_ms_fonts () {
	# Accept the EULA for using Microsoft Core fonts
	echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
	sudo apt install -y ttf-mscorefonts-installer
}

install_ms_fonts
