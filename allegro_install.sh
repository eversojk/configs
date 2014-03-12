#!/bin/bash

# required dependencies
sudo apt-get install build-essential git cmake cmake-curses-gui xorg-dev libgl1-mesa-dev libglu-dev -y
# optional dependencies
sudo apt-get install libpng-dev libcurl4-openssl-dev libfreetype6-dev libjpeg-dev libvorbis-dev libopenal-dev libphysfs-dev libgtk2.0-dev libasound-dev libpulse-dev libflac-dev libdumb1-dev -y

#git clone git://git.code.sf.net/p/alleg/allegro
cd allegro
git checkout 5.0
mkdir -p build
cd build

# hit c twice, then g, can choose any options
ccmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
sudo make install

cd ../../
rm -rf allegro
