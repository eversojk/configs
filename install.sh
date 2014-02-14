#!/bin/bash

# remap caps lock to control
/usr/bin/setxkbmap -option "ctrl:nocaps"


sudo rm -r Music
sudo rm -r Public
sudo rm -r Templates
sudo rm -r Videos

wget https://github.com/eversojk/scripts/archive/master.zip
unzip master.zip
cp scripts-master/.vimrc ~
cp scripts-master/.bashrc ~
cp scripts-master/.bash_aliases ~
cp scripts-master/.bash_aliases ~
cp scripts-master/%gconf.xml ~/.gconf/apps/gnome-terminal/profiles/Default/
sudo rm -r scripts-master
rm master.zip

sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install python-pip -y
sudo apt-get install g++ -y
sudo apt-get install chromium-browser -y
sudo apt-get install mumble -y

if [[ -n $(which steam) ]]; then
    echo "steam is already installed"
else
    wget http://media.steampowered.com/client/installer/steam.deb
    sudo dpkg -i steam.deb
    sudo apt-get -f install -y
    rm steam.deb
fi

if [[ -n $(which spotify) ]]; then
    echo "spotify is already installed"
else
    echo "deb http://repository.spotify.com stable non-free" | sudo tee -a "/etc/apt/sources.list.d/john.list"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recvkeys 94558F59
    sudo apt-get update
    sudo apt-get install --force-yes spotify-client -y
fi
