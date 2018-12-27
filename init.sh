#!/bin/bash
# Author : Corb3nik
####################

mkdir ~/tools
cd ~/tools

# Updates
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get -y update
sudo apt-get -y upgrade

# Utilities
sudo apt-get -y install unzip p7zip-full
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install python3-pip python-pip
sudo apt-get -y install ipython
sudo apt-get -y install wget
sudo apt-get -y install git
sudo apt-get -y install cmake
sudo apt-get -y install neovim
sudo apt-get -y install apt-file

# Libs
sudo apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get -y install libc6-dev libc6-dev-i386
sudo apt-get -y install libc6-dbg libc6-dbg:i386
sudo apt-get -y install libc6-armhf-armel-cross
sudo apt-get -y install build-essential gobjc gobjc++ gnustep gnustep-devel libgnustep-base-dev

####
# Reverse-Engineering & Pwning
####
# Angr
sudo pip install angr

# Pwntools
sudo pip install --upgrade git+https://github.com/Gallopsled/pwntools

# Ropper
sudo pip install ropper

# Pwndbg
cd ~/tools && git clone https://github.com/pwndbg/pwndbg
cd pwndbg && ./setup.sh

# Radare2
cd ~/tools && git clone https://github.com/radare/radare2
cd radare2 && ./sys/install.sh

# libc Database
cd ~/tools && git clone https://github.com/niklasb/libc-database

# Cross Debugging & Compiling
sudo apt-get -y install gcc-arm-linux-gnueabihf
sudo apt-get -y install gcc-powerpc-linux-gnu
sudo apt-get -y install qemu qemu-user qemu-user-static
sudo apt-get install 'binfmt*'
sudo mkdir /etc/qemu-binfmt
sudo ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm
sudo ln -s /usr/powerpc-linux-gnu /etc/qemu-binfmt/ppc

# OpenSSL 1.0.0 for ARM
cd ~/tools && git clone https://github.com/openssl/openssl
cd openssl && git checkout OpenSSL_1_0_0-stable
./Configure linux-armv4 shared && make CC=arm-linux-gnueabihf-gcc
sudo cp libssl.so* libcrypto.so* /etc/qemu-binfmt/arm/lib/

# uCLibc for PowerPC
cd ~/tools
sudo wget https://www.uclibc.org/downloads/binaries/0.9.30/mini-native-powerpc.tar.bz2
sudo tar -xjf mini-native-powerpc.tar.bz2 && rm mini-native-powerpc.tar.bz2
sudo cp mini-native-powerpc/lib/* /usr/powerpc-linux-gnu/lib/

####
# Forensics/Steganography
####
# Binwalk
cd ~/tools && git clone https://github.com/devttys0/binwalk
cd binwalk && sudo python setup.py install

echo "Done."
