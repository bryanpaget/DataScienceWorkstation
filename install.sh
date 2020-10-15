#!/usr/bin/env bash

#                  _____  _   _ _   _   _     _                           
#                 |  __ \| \ | | | | | | |   (_)                          
#                 | |  \/|  \| | | | | | |    _ _ __  _   ___  __         
#                 | | __ | . ` | | | | | |   | | '_ \| | | \ \/ /         
#                 | |_\ \| |\  | |_| | | |___| | | | | |_| |>  <          
#                  \____/\_| \_/\___/  \_____/_|_| |_|\__,_/_/\_\         
#            ______      _          _____      _
#            |  _  \    | |        /  ___|    (_)                    
#            | | | |__ _| |_ __ _  \ `--.  ___ _  ___ _ __   ___ ___ 
#            | | | / _` | __/ _` |  `--. \/ __| |/ _ \ '_ \ / __/ _ \
#            | |/ / (_| | || (_| | /\__/ / (__| |  __/ | | | (_|  __/
#            |___/ \__,_|\__\__,_| \____/ \___|_|\___|_| |_|\___\___|
#             _    _            _        _        _   _
#            | |  | |          | |      | |      | | (_)             
#            | |  | | ___  _ __| | _____| |_ __ _| |_ _  ___  _ __   
#            | |/\| |/ _ \| '__| |/ / __| __/ _` | __| |/ _ \| '_ \  
#            \  /\  / (_) | |  |   <\__ \ || (_| | |_| | (_) | | | | 
#             \/  \/ \___/|_|  |_|\_\___/\__\__,_|\__|_|\___/|_| |_| 
#
#                   GNU Linux Data Science Workstation
#
#
# Use this on a fresh install of Ubuntu 20.04 to unlock the power of open
# source data science tools. 
#
# Be the change.
#
# Take Notice: All packages installed with `apt` are vetted by Debian and
# Canonicial. They are secure. If any security breaches are discovered with
# the following packages, rest assured a patch will be deployed in a timely 
# manner.









#             ____ ____ ____ ____ __ _ ____ __  __   __   ____
#            (  __) ___) ___|  __|  ( (_  _|  )/ _\ (  ) / ___)
#             ) _)\___ \___ \) _)/    / )(  )(/    \/ (_/\___ \
#            (____|____(____(____)_)__)(__)(__)_/\_/\____(____/
# 
#            Essential packages for R, Python, Scala and Julia.

sudo apt update -y && sudo apt upgrade -y  

# Accept the EULA for using Microsoft Core fonts
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

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
	gnome-firmware \
	gnome-software-plugin-flatpak \
	gnome-tweaks \
	gnome-usage \
	gnupg-agent \
	hardinfo \
	htop \
	julia \
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
	r-base \
	ranger \
	rpm \
	scala \
	software-properties-common \
	sqlitebrowser \
	ssh \
	tig \
	ttf-mscorefonts-installer \
	vim \
	visidata \
	wget

#          ____  __   ___ __ _ ____ ____ 
#         (    \/  \ / __(  / (  __(  _ \
#          ) D (  O ( (__ )  ( ) _) )   /
#         (____/\__/ \___(__\_(____(__\_)
#         

# Docker

# For more information on Docker, visit: https://docs.docker.com/get-docker/

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

sudo usermod -aG docker $USER  # Add user to group docker so we don't have to type sudo all the time.


# ____ ___  _  _ 
# | __ |__] |  | 
# |__] |    |__| 
#                

# Graphics card stuff:

# First we check if we have an Nvidia or AMD graphics card and then
# run the appropriate installer script. If no discrete graphics
# card is found, we skip to the next part.

if [ "$(sudo lspci | grep AMD)" ]; then

	echo "AMD card found."
	./amd.sh

elif [ "$(sudo lspci | grep NVIDIA)" ]; then

	echo "NVIDI card found."
	./nvidia.sh

else

	echo "No discrete graphics card detected."

fi


# ____    ____ ___ _  _ ___  _ ____ 
# |__/    [__   |  |  | |  \ | |  | 
# |  \    ___]  |  |__| |__/ | |__| 
#                                   

# R Studio is an excellent data science and data analytics IDE
# designed for R, C++, Stan

cd ~/Downloads
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb
sudo dpkg -i ./rstudio-1.3.1093-amd64.deb


#  _ _  _ ___  _   _ ___ ____ ____    _    ____ ___  
#  | |  | |__]  \_/   |  |___ |__/    |    |__| |__] 
# _| |__| |      |    |  |___ |  \    |___ |  | |__] 
#                                                    

# Jupyter Lab and other Python goodies.


pip3 install --user \
	astrowidgets \
	databrickslabs-jupyterlab \
	floatview \
	gcp-jupyterlab-shared \
	jupyter-dojo \
	jupyter-project \
	jupyterlab \
	jupyterlab-autoversion \
	jupyterlab-black \
	jupyterlab-bookmarks-extension \
	jupyterlab-celltests \
	jupyterlab-cognos-dashboard-embedded \
	jupyterlab-commands \
	jupyterlab-commenting-service \
	jupyterlab-dash \
	jupyterlab-discovery \
	jupyterlab-downloadfolder \
	jupyterlab-email \
	jupyterlab-geojs \
	jupyterlab-git \
	jupyterlab-github \
	jupyterlab-gitlab \
	jupyterlab-gitplus \
	jupyterlab-hdf \
	jupyterlab-latex \
	jupyterlab-launcher \
	jupyterlab-nbconvert-nocode \
	jupyterlab-nvdashboard \
	jupyterlab-powerpoint \
	jupyterlab-pullrequests \
	jupyterlab-pygments \
	jupyterlab-python-file \
	jupyterlab-quickopen \
	jupyterlab-s3-browser \
	jupyterlab-scheduler \
	jupyterlab-server \
	jupyterlab-snippets \
	jupyterlab-snippets-multimenus \
	jupyterlab-spark-ui-tab \
	jupyterlab-sparkmonitor \
	jupyterlab-sql \
	jupyterlab-templates \
	jupyterlab-translate \
	jupyterlab-widgets \
	jupyterlab-zip \
	knowledgelab \
	matplotlib \
	mavenworks \
	multicontentsmanager \
	nbcelltests \
	notebook-snippets \
	perspective-python \
	pyls \
	pyls-mypy \
	python-language-server[all] \
	sidecar \
	tensorflow \
	tfds-nightly


# ____ _    ____ ___ ___  ____ _  _ 
# |___ |    |__|  |  |__] |__| |_/  
# |    |___ |  |  |  |    |  | | \_ 
#                                   

# Flatpaks are containerized packages and can update indepently of the base
# operating system (similar to snaps). I've included some flatpaks here because
# we want to stick with a solid base (Ubuntu 20.04) but we may want to use the latest
# version of a specific app. Flatpak and Snap make this a breeze.

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
	ch.openboard.OpenBoard \
	com.github.alainm23.planner \
	com.github.artemanufrij.regextester \
	com.github.calo001.fondo \
	com.github.jeromerobert.pdfarranger \
	com.github.johnfactotum.Foliate \
	com.github.junrrein.PDFSlicer \
	com.github.maoschanz.drawing \
	com.microsoft.Teams \
	com.rafaelmardojai.Blanket \
	com.uploadedlobster.peek \
	flathub com.gitlab.newsflash \
	net.codeindustry.MasterPDFEditor \
	net.supertuxkart.SuperTuxKart \
	net.veloren.veloren \
	nl.hjdskes.gcolor3 \
	org.cvfosammmm.Setzer \
	org.gabmus.notorious \
	org.gabmus.whatip \
	org.glimpse_editor.Glimpse \
	org.gnome.Chess \
	org.gnome.Connections \
	org.gnome.GTG \
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


# ____ _  _ ____ ___  ____ 
# [__  |\ | |__| |__] [__  
# ___] | \| |  | |    ___] 
#                          

# Snaps are Canonical's containerized packages. Very secure, vetted by Canonical.

sudo snap install \
	brave \
	chromium \
	codium \
	dbeaver-ce \
	flameshot \
	notable --classic  \
	onlyoffice-desktopeditors \
	slack \
	spotify \
	telegram-desktop \
	wps-office


# ____ _  _ ___ ____ ____ ____ 
# |___  \/   |  |__/ |__| [__  
# |___ _/\_  |  |  \ |  | ___] 
#                              

# Extra packages and tweaks to make the system more awesome.

# Bash git prompt: show git information in the Bash prompt!

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

echo 'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then 
	GIT_PROMPT_ONLY_IN_REPO \=1
	source \ $HOME/.bash-git-prompt/gitprompt.sh
fi' | tee -a ~/.bashrc 


# Doom Emacs

# Emacs is an extensible text editor.
#
# Doom Emacs which has the
# best out-of-the-box user experience. Doom Emacs is easy to configure.

# https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#configure

# sudo apt install -y emacs
# git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
# ~/.emacs.d/bin/doom install

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
