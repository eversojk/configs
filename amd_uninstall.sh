#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "This script shouldn't be run as root!"
    exit 1
fi

# remove drivers
sudo /usr/share/ati/fglrx-uninstall.sh
sudo apt-get purge fglrx*

#remove x11 conf to reset to default
sudo rm /etc/X11/xorg.conf

# resintall xorg completely
sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx:i386 libgl1-mesa-dri:i386 libgl1-mesa-glx:amd64 libgl1-mesa-dri:amd64

# reconfigure xorg
sudo dpkg-reconfigure xserver-xorg

sudo reboot
