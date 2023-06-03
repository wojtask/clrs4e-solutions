#!/usr/bin/env bash

# download mtp2lite fonts and the installation script
wget https://mirrors.ctan.org/fonts/mtp2lite.zip
wget https://raw.githubusercontent.com/jamespfennell/mathtime-installer/master/mtpro2-texlive.sh

# make a necessary change to the installation script to make it compatible with the CTAN version of the font
sed -i 's%${TEMPDIR}/texmf%${TEMPDIR}/mtp2lite/texmf%g' mtpro2-texlive.sh

# install the font in TeXLive
chmod +x ./mtpro2-texlive.sh
./mtpro2-texlive.sh -i mtp2lite.zip
