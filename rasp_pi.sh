#!/bin/bash

wget https://github.com/eversojk/scripts/archive/master.zip
unzip master.zip
cp scripts-master/.vimrc ~
cp scripts-master/.bashrc ~
cp scripts-master/.bash_aliases ~
cp scripts-master/.gitconfig ~
sudo rm -r scripts-master
rm master.zip

sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install python-pip -y

sudo apt-get update

sudo apt-get upgrade
