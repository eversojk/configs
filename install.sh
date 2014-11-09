#!/bin/bash

append_file () {
    echo "$1" | sudo tee -a "$2"
}

sudo rm -r Music
sudo rm -r Public
sudo rm -r Templates
sudo rm -r Videos

wget https://github.com/eversojk/scripts/archive/master.zip
unzip master.zip
cp scripts-master/.vimrc ~
cp scripts-master/.bashrc ~
cp scripts-master/.bash_aliases ~
cp scripts-master/.gitconfig ~
cp scripts-master/%gconf.xml ~/.gconf/apps/gnome-terminal/profiles/Default/
sudo rm -r scripts-master
rm master.zip

wget http://media.steampowered.com/client/installer/steam.deb
sudo dpkg -i steam.deb
sudo apt-get -f install -y
rm steam.deb
# disables steam always being in the taskbar
append_file 'STEAM_FRAME_FORCE_CLOSE=1' "/etc/environment"

append_file "deb http://repository.spotify.com stable non-free" "/etc/apt/sources.list.d/spotify.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install --force-yes spotify-client -y

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
append_file "deb http://dl.google.com/linux/chrome/deb/ stable main" "/etc/apt/sources.list.d/google-chrome.list"

# ppa
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo add-apt-repository ppa:jonls/redshift-ppa -y
sudo add-apt-repository ppa:mumble/release -y

#removes
sudo apt-get remove firefox -y
sudo apt-get remove firefox-locale-en -y
sudo apt-get remove thunderbird -y
sudo apt-get remove thunderbird-gnome-support -y
sudo apt-get remove thunderbird-locale-en -y
sudo apt-get remove thunderbird-locale-en-us -y

sudo apt-get update

sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install python-pip -y
sudo apt-get install g++ -y
sudo apt-get install google-chrome-stable -y
sudo apt-get install mumble -y
sudo apt-get install grub-customizer -y
sudo apt-get install redshift -y
sudo apt-get install screen -y
sudo apt-get install shutter -y
sudo apt-get install redshift-gtk -y

sudo apt-get upgrade -y
