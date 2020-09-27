#!/usr/bin/env bash

#    _____  _   _  _    _   _       _____  _   _  _    _ __   __
#   / ____|| \ | || |  | | | |     |_   _|| \ | || |  | |\ \ / /
#  | |  __ |  \| || |  | | | |       | |  |  \| || |  | | \ V / 
#  | | |_ || . ` || |  | | | |       | |  | . ` || |  | |  > <  
#  | |__| || |\  || |__| | | |____  _| |_ | |\  || |__| | / . \ 
#   \_____||_| \_| \____/  |______||_____||_| \_| \____/ /_/ \_\
#                                                               
#                                                               
# 
#   _____          _            _____        _                          __          __           _          _          _    _               
#  |  __ \        | |          / ____|      (_)                         \ \        / /          | |        | |        | |  (_)              
#  | |  | |  __ _ | |_  __ _  | (___    ___  _   ___  _ __    ___  ___   \ \  /\  / /___   _ __ | | __ ___ | |_  __ _ | |_  _   ___   _ __  
#  | |  | | / _` || __|/ _` |  \___ \  / __|| | / _ \| '_ \  / __|/ _ \   \ \/  \/ // _ \ | '__|| |/ // __|| __|/ _` || __|| | / _ \ | '_ \ 
#  | |__| || (_| || |_| (_| |  ____) || (__ | ||  __/| | | || (__|  __/    \  /\  /| (_) || |   |   < \__ \| |_| (_| || |_ | || (_) || | | |
#  |_____/  \__,_| \__|\__,_| |_____/  \___||_| \___||_| |_| \___|\___|     \/  \/  \___/ |_|   |_|\_\|___/ \__|\__,_| \__||_| \___/ |_| |_|
#                                                                                                                                           

# GNU Linux Data Science Workstation

# Use this on a fresh install of Ubuntu 20.04 to gain all the awesome power of open source data science tools.
# Be the change. Be the wizard. Just be awesome. Don't be racist.

# Take Notice: All packages installed with `apt` are vetted by Debian and Canonicial. 
# They are secure. If any security breaches are discovered with the following packages, 
# rest assured a patch will be deployed in a timely manner.


# ____ ____ ____ ____ _  _ ___ _ ____ _    ____ 
# |___ [__  [__  |___ |\ |  |  | |__| |    [__  
# |___ ___] ___] |___ | \|  |  | |  | |___ ___] 
#                                               

# Essential packages for R, Python, Scala and Julia to work correctly.

sudo apt update -y && sudo apt upgrade -y  # Update package list. Download and install any updates.

sudo apt install \
 	apt-transport-https \                   # Required by R Packages
    apt-utils \                             # Required by R Packages
    build-essential \                       # Required by R Packages
    ca-certificates \                       # Required by R Packages
    clang \                                 # Required by R Packages
    clang-format \                          # Required by R Packages
    clang-tidy \                            # Required by R Packages
    cmake \                                 # Required by R Packages
    cmake-qt-gui \                          # Required by R Packages
    curl \                                  # Download things, needed by R
    g++-multilib \                          # Required by R Packages.
    gfortran \                              # Required by R Packages.
    gnupg-agent \                           # GNU privacy guard
	julia \                                 # The best math/stats/machine learning language.
    libboost-dev \                          # Required by R Packages. 
    libboost-filesystem-dev \               # Required by R Packages. 
    libboost-program-options-dev \          # Required by R Packages. 
    libboost-system-dev \                   # Required by R Packages. 
    libcurl4-openssl-dev \                  # Required by R Packages. 
    libelf-dev \                            # Required by R Packages.  
    libfftw3-dev \                          # Required by R Packages. 
    libncurses5-dev \                       # Required by R Packages. 
    libpthread-stubs0-dev \                 # Required by R Packages. 
    libssl-dev \                            # Required by R Packages. 
    libunwind-dev \                         # Required by R Packages. 
    nodejs \                                # Node is required by JupyterLab for extensions.
    npm \                                   # Required by JupyterLab extensions.
    pkg-config \                            # Required by R Packages.  
    python3-pip \                           # Python package manager
    r-base \                                # R statistical programming language
    rpm \                                   # Red Hat package manager
    scala \                                 # Data engineering language for the JVM
    wget                                    # Download things, needed by many R packages

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


# ___  ____ ____ _  _ ____ ____ 
# |  \ |  | |    |_/  |___ |__/ 
# |__/ |__| |___ | \_ |___ |  \ 
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

# First we check if we have an Nvidia or AMD graphics card:

CARD=FALSE

sudo lspci | grep AMD    >/dev/null && CARD=AMD   || CARD=FALSE
sudo lspci | grep NVIDIA >/dev/null && CARD=NVIDA || CARD=FALSE

# Then run the appropriate installer script. If no discrete graphics 
# card is found, we skip to the next part.

if [ "$CARD" == AMD ]; then 
    echo "AMD graphics card detected."
    ./amd.sh;
elif [ "$CARD" == NVIDIA ]; then
    echo "NVIDIA graphics card detected."
    ./nvidia.sh;
else
    echo "No discrete graphics card detected."
fi


# ____    ____ ___ _  _ ___  _ ____ 
# |__/    [__   |  |  | |  \ | |  | 
# |  \    ___]  |  |__| |__/ | |__| 
#                                   

# R Studio

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


# ____ _    ____ ___ ___  ____ _  _ 
# |___ |    |__|  |  |__] |__| |_/  
# |    |___ |  |  |  |    |  | | \_ 
#                                   

# Flatpaks are containerized packages and can update indepently of the base
# operating system (similar to snaps). I've included some flatpaks here because
# we want to stick with a solid base (Ubuntu 20.04) but we may want to use the latest
# version of a specific app. Flatpak and Snap make this a breeze.

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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


# ____ _  _ ____ ___  ____ 
# [__  |\ | |__| |__] [__  
# ___] | \| |  | |    ___] 
#                          

# Snaps are Canonical's containerized packages. Very secure, vetted by Canonical.

sudo snap install \
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

# Emacs is an extensible text editor. You can consider it to be the original
# VS Code. Installing an Emacs distribution called Doom Emacs which has the
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

curl -L https://source.unsplash.com/user/pawel_czerwinski/3840x2160 > ~/Pictures/wallpaper.jpg
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/wallpaper.jpg

# Clean up

sudo apt clean 
sudo apt autoclean