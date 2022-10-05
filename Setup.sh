#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    id_like=$(awk -F= '$1 == "ID_LIKE" {print $2}' /etc/os-release)
    if [[ "$distro" == "arch" || "$id_like" == "arch" ]]; then
       echo "Arch Linux Detected"
       sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc xz python-pip brotli lz4 gawk libmpack aria2
       #aur=rar
    else
       sudo apt install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python-pip brotli liblz4-tool gawk aria2
       sudo apt update && sudo apt upgrade
       sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
       sudo apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
       git clone https://github.com/akhilnarang/scripts --depth=1
       git clone https://github.com/Krazy-Goel/mirror1 -b h-code --depth=1
       sudo apt install -y python3 python3-pip
       cd scripts
       bash setup/android_build_env.sh
       sudo apt-get update
       sudo apt-get install repo
       git config --global user.name Harshit Tiwari
       git config --global user.email tech.harshit.tiwari@gmail.com
       mkdir rom && cd rom
       mkdir ~/bin
       PATH=~/bin:$PATH
       curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
       chmod a+x ~/bin/repo 
       mkdir olives
       cd olives
       mkdir corvus
       cd corvus
       sudo apt install -y snapd
       sudo apt install -y docker
       sudo snap install docker
    fi
    pip install backports.lzma protobuf pycrypto
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2
    pip install backports.lzma protobuf pycrypto
fi
