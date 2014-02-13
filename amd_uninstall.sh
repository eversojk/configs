#!/bin/bash

# remove drivers
sudo apt-get purge fglrx*

#remove x11 conf to reset to default
sudo rm /etc/X11/xorg.conf

# resintall xorg completely
sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx:i386 libgl1-mesa-dri:i386 libgl1-mesa-glx:amd64 libgl1-mesa-dri:amd64

# reconfigure xorg
sudo dpkg-reconfigure xserver-xorg

sudo reboot
