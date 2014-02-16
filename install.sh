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
cp scripts-master/.bash_aliases ~
cp scripts-master/.gitconfig ~
cp scripts-master/%gconf.xml ~/.gconf/apps/gnome-terminal/profiles/Default/

## move script to remap caps to ctrl on startup
#sudo mkdir -p /usr/local/scripts
#sudo cp scripts-master/remap_caps.sh /usr/local/scripts
#sudo chmod u+x /usr/local/scripts/remap_caps.sh
#write_file "#!/bin/sh -e
#/usr/local/scripts/remap_caps.sh
#exit 0" "/etc/rc.local"

sudo rm -r scripts-master
rm master.zip

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
    append_file "deb http://repository.spotify.com stable non-free" "/etc/apt/sources.list.d/john.list"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recvkeys 94558F59
    sudo apt-get update
    sudo apt-get install --force-yes spotify-client -y
fi

# ppa
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo add-apt-repository ppa:mumble/release -y

sudo apt-get update

sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install python-pip -y
sudo apt-get install g++ -y
sudo apt-get install openjdk-7-jdk -y
sudo apt-get install chromium-browser -y
sudo apt-get remove firefox -y
sudo apt-get install mumble -y
sudo apt-get install grub-customizer

sudo apt-get upgrade -y
