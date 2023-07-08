#!/usr/bin/env bash

# download mtp2lite fonts and the installation script
wget https://mirrors.ctan.org/fonts/mtp2lite.zip
wget https://raw.githubusercontent.com/jamespfennell/mathtime-installer/master/mtpro2-texlive.sh

# install the font in TeXLive
chmod +x ./mtpro2-texlive.sh
./mtpro2-texlive.sh -i mtp2lite.zip
