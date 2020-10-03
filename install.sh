#!/usr/bin/env bash

#                  _____  _   _ _   _   _     _                           
#                 |  __ \| \ | | | | | | |   (_)                          
#                 | |  \/|  \| | | | | | |    _ _ __  _   ___  __         
#                 | | __ | . ` | | | | | |   | | '_ \| | | \ \/ /         
#                 | |_\ \| |\  | |_| | | |___| | | | | |_| |>  <          
#                  \____/\_| \_/\___/  \_____/_|_| |_|\__,_/_/\_\         
<<<<<<< HEAD
#            ______      _          _____      _
=======
#                                                                         
#                                                                     
#            ______      _          _____      _                     
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe
#            |  _  \    | |        /  ___|    (_)                    
#            | | | |__ _| |_ __ _  \ `--.  ___ _  ___ _ __   ___ ___ 
#            | | | / _` | __/ _` |  `--. \/ __| |/ _ \ '_ \ / __/ _ \
#            | |/ / (_| | || (_| | /\__/ / (__| |  __/ | | | (_|  __/
#            |___/ \__,_|\__\__,_| \____/ \___|_|\___|_| |_|\___\___|
<<<<<<< HEAD
#             _    _            _        _        _   _
=======
#                                                                    
#                                                                    
#             _    _            _        _        _   _              
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe
#            | |  | |          | |      | |      | | (_)             
#            | |  | | ___  _ __| | _____| |_ __ _| |_ _  ___  _ __   
#            | |/\| |/ _ \| '__| |/ / __| __/ _` | __| |/ _ \| '_ \  
#            \  /\  / (_) | |  |   <\__ \ || (_| | |_| | (_) | | | | 
#             \/  \/ \___/|_|  |_|\_\___/\__\__,_|\__|_|\___/|_| |_| 
<<<<<<< HEAD
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
=======
                                                                    
#                   GNU Linux Data Science Workstation
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe




<<<<<<< HEAD





#             ____ ____ ____ ____ __ _ ____ __  __   __   ____
=======
# Use this on a fresh install of Ubuntu 20.04 to unlock the power of open
# source data science tools. 

# Be the change...
			                             # ...Don't be racist.

# Take Notice: All packages installed with `apt` are vetted by Debian and
# Canonicial. They are secure. If any security breaches are discovered with
# the following packages, rest assured a patch will be deployed in a timely 
# manner.



#             ____ ____ ____ ____ __ _ ____ __  __   __   ____ 
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe
#            (  __) ___) ___|  __|  ( (_  _|  )/ _\ (  ) / ___)
#             ) _)\___ \___ \) _)/    / )(  )(/    \/ (_/\___ \
#            (____|____(____(____)_)__)(__)(__)_/\_/\____(____/
# 
#            Essential packages for R, Python, Scala and Julia.

<<<<<<< HEAD
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
=======


# These are four common languages used in data science and machine learning.
# A brief description and the use cases for each language is given below:

# Julia: The best math/stats/machine learning language.
# Python: ...
# R ...
# Scala

# Update package list. Download and install any updates.

sudo apt update -y && sudo apt upgrade -y  

sudo apt install \
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
        g++-multilib \                         
        gfortran \                            
        gnupg-agent \                        
	julia \                             
        libboost-dev \                          
        libboost-filesystem-dev \               
        libboost-program-options-dev \          
        libboost-system-dev \                   
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
	rpm \                                 
	scala \                                
	wget                                    

# Essential Quality of Life Improving Packages:

sudo apt install \
	deja-dup \                              # GNOME backup manager
	flatpak \                               # Secure, containerized apps.
	git \                                   # Version control.
	glances \                               # Awesome system stats.
	gnome-firmware \                        # Firmware updater.
	gnome-software-plugin-flatpak \         # Install flatpak packages from GNOME software GUI.
	gnome-tweaks \                          # Extra settings for making GNOME your own.
	gnome-usage \                           # Beautiful system resources app.
	hardinfo \                              # Information about your hardware.
	htop \                                  # System stats
	ranger \                                # Column-based file manager for the terminal, similar to macOS Finder
	software-properties-common \            # Required by GNOME software
	ssh \                                   # Secure Shell
	sqlitebrowser \                         # View sqlite database files.
	tig \                                   # Awesome git tool for the command line
	ttf-mscorefonts-installer \             # Microsoft's pesky fonts
	vim \                                   # Modal text editing
	visidata                                # Who needs Excel? This is the fastest spreadsheet app for the console. Tip: The command is vd.
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe

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

sudo apt-get install \
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

<<<<<<< HEAD
else

	echo "No discrete graphics card detected."

=======
if [ "$CARD" == AMD ]; then 
	echo "AMD graphics card detected."
	./amd.sh;
elif [ "$CARD" == NVIDIA ]; then
	echo "NVIDIA graphics card detected."
	./nvidia.sh;
else
	echo "No discrete graphics card detected."
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe
fi


# ____    ____ ___ _  _ ___  _ ____ 
# |__/    [__   |  |  | |  \ | |  | 
# |  \    ___]  |  |__| |__/ | |__| 
#                                   

# R Studio is an excellent data science and data analytics IDE
# designed for R, C++, Stan

cd ~/Downloads
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb
sudo dpkg -i ./rstudio-1.3.1093-amd64.deb  # Will not complete since there are depencies.
sudo apt install --fix-broken  # This will complete the install.


#  _ _  _ ___  _   _ ___ ____ ____    _    ____ ___  
#  | |  | |__]  \_/   |  |___ |__/    |    |__| |__] 
# _| |__| |      |    |  |___ |  \    |___ |  | |__] 
#                                                    

# Jupyter Lab and other Python goodies.


pip3 install --user \
<<<<<<< HEAD
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
=======
	astrowidgets \                           # Widgets for the Jupyter notebook and JupyterLab
	databrickslabs-jupyterlab \              # Remote JupyterLab kernel for Databricks
	floatview \                              # A floatview output widget for JupyterLab + GlueViz Visualization with plotly
	gcp-jupyterlab-shared \                  # Shared libraries for JupyterLab extensions
	jupyter-dojo \                           # A JupyterLab and Jupyter Notebook extension for rendering unittest results
	jupyter-project \                        # An JupyterLab extension to handle project and files templates.
	jupyterlab \
	jupyterlab-autoversion \                 # Automatically version jupyter notebooks on save
	jupyterlab-black \                       # The server extension for jupyterlab_black, to apply the black formatter to codecell content.
	jupyterlab-bookmarks-extension \         # A JupyterLab extension to provide Launcher icons for favorites. Allows 'bookmarking' files for quick access from the Launcher.
	jupyterlab-celltests \                   # Cell-by-cell tests for JupyterLab
	jupyterlab-cognos-dashboard-embedded \   # 
	jupyterlab-commands \                    # Arbitrary python commands for notebooks in JupyterLab
	jupyterlab-commenting-service \
	jupyterlab-dash \                        # A JupyterLab extensions for rendering Plotly Dash apps
	jupyterlab-discovery \                   # A JupyterLab extension to facilitate the discovery and installation of other extensions
	jupyterlab-downloadfolder \              # Plugin JupyterLab for Downloading a folder as archive
	jupyterlab-email \                       # Sending emails from JupyterLab
	jupyterlab-geojs \                       # A package for rendering GeoJS scenes in JupyterLab
	jupyterlab-git \                         # A server extension for JupyterLab's git extension
	jupyterlab-github \                      # A Jupyter Notebook server extension which acts a proxy for the GitHub API.
	jupyterlab-gitlab \                      # A Jupyter Notebook server extension which acts as a proxy for the GitLab API.
	jupyterlab-gitplus \                     # JupyterLab extension to create GitHub pull requests
	jupyterlab-hdf \                         # A Jupyter Notebook server extension that provides APIs for fetching hdf5 contents and data. Built on h5py.
	jupyterlab-latex \                       # A Jupyter Notebook server extension which acts as an endpoint for LaTeX.
	jupyterlab-launcher \                    # Jupyter Launcher
	jupyterlab-nbconvert-nocode \            # A simple helper library with 2 NBConvert exporters for PDF/HTML export with no code cells
	jupyterlab-nvdashboard \                 # A JupyterLab extension for displaying dashboards of GPU usage.
	jupyterlab-powerpoint \                  # Create powerpoints from jupyter notebooks
	jupyterlab-pullrequests \                # A server extension for JupyterLab's pull request extension
	jupyterlab-pygments \                    # Pygments theme using JupyterLab CSS variables
	jupyterlab-python-file \                 # Create Python Files from JupyterLab
	jupyterlab-quickopen \                   # Quickly open a file in JupyterLab by typing part of its name
	jupyterlab-s3-browser \                  # A Jupyter server extension for the JupyterLab S3 Browser extension
	jupyterlab-scheduler \                   # CRON scheduler for Jupyter Lab
	jupyterlab-server \
	jupyterlab-snippets \                    # Code Snippets Extension for JupyterLab
	jupyterlab-snippets-multimenus \ 
	jupyterlab-spark-ui-tab \                # Spark UI extension for jupyterlab
	jupyterlab-sparkmonitor \                # Spark Monitor Extension for Jupyter Lab
	jupyterlab-sql \                         # JupyterLab plugin for visualizing SQL databases
	jupyterlab-templates \                   # Notebook templates
	jupyterlab-translate \                   # Jupyterlab Language Pack Translations Helper
	jupyterlab-widgets \                     # JupyterLab extension providing HTML widgets
	jupyterlab-zip \                         # Zip and download folder contents
	knowledgelab \                           # Knowledge Repo integration for JupyterLab
	matplotlib \
	mavenworks \                             # Dashboarding for JupyterLab
	multicontentsmanager \                   # Automatically version notebooks from JupyterLab
	nbcelltests \                            # Cell-by-cell tests for JupyterLab
	notebook-snippets \                      # code snippets integration for JupyterLab
	perspective-python \                     # Python bindings and JupyterLab integration for Perspective
	sidecar \                                # A sidecar output widget for JupyterLab
	tensorflow \
	tfds-nightly                             # Tensorflow datasets for experimenting
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe


# ____ _    ____ ___ ___  ____ _  _ 
# |___ |    |__|  |  |__] |__| |_/  
# |    |___ |  |  |  |    |  | | \_ 
#                                   

# Flatpaks are containerized packages and can update indepently of the base
# operating system (similar to snaps). I've included some flatpaks here because
# we want to stick with a solid base (Ubuntu 20.04) but we may want to use the latest
# version of a specific app. Flatpak and Snap make this a breeze.

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

<<<<<<< HEAD
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
	org.gnome.boxes \
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
=======
# Fun stuff:

flatpak install -y \
	com.github.calo001.fondo \                          # Find unsplash wallpapers
	com.github.johnfactotum.Foliate \                   # Read a book while your model trains
	com.github.maoschanz.drawing \                      # Simple drawing tool like MS Paint
	net.supertuxkart.SuperTuxKart \                     # For racing with coworkers after work.
	net.veloren.veloren \                               # Is this like Minecraft?
	org.gnome.Chess \                                   # Play chess while your model trains
	org.gnome.Polari \                                  # IRC, yes people still use it
	org.gustavoperedo.FontDownloader \                  # Find some nice fonts
	org.videolan.VLC                                    # Play any video

# Serious stuff:

flatpak install -y \
	ch.openboard.OpenBoard \                            # Whiteboard
	com.github.alainm23.planner \                       # To do app with todoist integration
	com.github.artemanufrij.regextester \               # Test your regex
	com.github.jeromerobert.pdfarranger \               # Rearrange PDFs
	com.github.junrrein.PDFSlicer \                     # Slice PDFs
	com.microsoft.Teams \                               # Because we use this
	com.rafaelmardojai.Blanket \                        # White noise app to help concentrate
	com.uploadedlobster.peek \                          # Screen recorder, useful for making instructional videos
	flathub com.gitlab.newsflash \                      # RSS feed reader, stay on top of reserach
	net.codeindustry.MasterPDFEditor \                  # Do anything to a PDF, proprietary
	nl.hjdskes.gcolor3 \                                # Pick colors from screen
	org.cvfosammmm.Setzer \                             # Easy LaTeX editor
	org.gabmus.notorious \                              # Dead simple notes
	org.gabmus.whatip \                                  # What is my IP address?
	org.glimpse_editor.Glimpse \                        # Bitmap image editor
	org.gnome.Connections \                             # Remote desktop connections
	org.gnome.GTG \                                     # Getting things done, GNOME style
	org.gnome.boxes \                                   # Virtual machine manager
	org.gnome.builder \                                 # IDE for C and GTK apps
	org.gnome.calendar \                                # GNOME calendar app
	org.gnome.documents \                               # GNOME document manager
	org.gnome.gitg \                                    # Graphical Git interface
	org.gnome.gitlab.somas.Apostrophe \                 # Markdown editor
	org.gnome.gitlab.somas.Apostrophe.Plugin.TexLive \  # LaTeX support for Apostrophe
	org.gnome.meld \                                    # View the difference between files, line by line
	org.gnome.todo \                                    # GNOME todo manager
	org.inkscape.Inkscape \                             # Vector drawing
	org.jamovi.jamovi \                                 # Statistical spreadsheet app
	us.zoom.Zoom                                        # Because we use this
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe


# ____ _  _ ____ ___  ____ 
# [__  |\ | |__| |__] [__  
# ___] | \| |  | |    ___] 
#                          

# Snaps are Canonical's containerized packages. Very secure, vetted by Canonical.

sudo snap install \
<<<<<<< HEAD
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
=======
	chromium \                                          # Google-free Chrome
	codium \                                            # Completely open source version of VS Code, no spyware.
	dbeaver-ce \                                        # General purpose database tool.
	flameshot \                                         # Amazing screenshot tool
	notable --classic  \                                # Simple and effective markdown note-taking app.
	onlyoffice-desktopeditors \                         # Better than LibreOffice open source office suite.
	slack \                                             # Chat, there are open source alternative though.
	spotify \                                           # Music.
	telegram-desktop \                                  # Also chat, somewhat like WhatsApp.
	wps-office                                          # Chinese office suite, very nice, proprietary...
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe


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
<<<<<<< HEAD


npm i bash-language-server
npm install vscode-html-languageserver-bin
npm install dockerfile-language-server-nodejs
npm install yaml-language-server
=======
>>>>>>> 518cd1b80a673a001675a19a61261028f97736fe
