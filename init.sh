#!/bin/bash
# Author : Corb3nik
####################

mkdir ~/tools
cd ~/tools

# Updates
sudo apt-get -y update
sudo apt-get -y upgrade

# Utilities
sudo apt-get -y install unzip, p7zip-full
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install python3-pip python-pip
sudo apt-get -y install ipython
sudo apt-get -y install wget
sudo apt-get -y install git

# Angr
sudo pip install angr

# Pwntools
sudo pip install --upgrade git+https://github.com/Gallopsled/pwntools

# Ropper
sudo pip install ropper

# Pwndbg
cd ~/tools && git clone https://github.com/pwndbg/pwndbg
cd pwndbg && ./setup.sh

# Binwalk
cd ~/tools && git clone https://github.com/devttys0/binwalk
cd binwalk && sudo python setup.py install

# Radare2
cd ~/tools && git clone https://github.com/radare/radare2
cd radare2 && ./sys/install.sh

