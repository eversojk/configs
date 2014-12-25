#!/bin/bash

sudo pacman -Syu

# Setup terminal and config files

# disable pc speaker
echo "blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

sudo pacman -S --noconfirm zip unzip

curl -L -O https://github.com/eversojk/scripts/archive/master.zip
unzip master.zip
cp scripts-master/.bash_aliases ~
cp scripts-master/.bashrc ~
cp scripts-master/.gitconfig ~
cp scripts-master/.vimrc ~
cp scripts-master/redshift.conf ~/.config/
sudo cp scripts-master/i3status.conf /etc/
mkdir -p ~/.i3
sudo cp scripts-master/i3_config ~/.i3/config
sudo rm -r scripts-master
rm master.zip

sudo pacman -S --noconfirm cowsay fortune-mod

# Setup yaourt
mkdir ~/builds
cd ~/builds

# install package-query for yaourt
curl -L -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar -xvf package-query.tar.gz
cd package-query
makepkg -s --noconfirm
sudo pacman -U --noconfirm package-query*.pkg.tar.xz

cd ~/builds
curl -L -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xvf yaourt.tar.gz
cd yaourt
makepkg -s --noconfirm
sudo pacman -U --noconfirm yaourt*.pkg.tar.xz

# Install X
sudo pacman -S xorg-server
sudo pacman -S --noconfirm xorg-xinit
sudo pacman -S --noconfirm xorg-setxkbmap
sudo pacman -S --noconfirm xorg-xauth
# Set caps lock as control
echo "setxkbmap -option ctrl:nocaps &" | tee -a ~/.xinitrc

# Install nvidia
echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy
sudo pacman -S --noconfirm nvidia
sudo pacman -S --noconfirm lib32-nvidia-libgl
# Load nvidia config
echo "nvidia-settings --load-config-only &" | tee -a ~/.xinitrc
# Set graphics card to max performance
echo "nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1 &" | tee -a ~/.xinitrc

# Install sound
sudo pacman -S pulseaudio
sudo pacman -S pulseaudio-alsa
echo "start-pulseaudio-x11 &" | tee -a ~/.xinitrc
echo "amixer sset Master unmute &" | tee -a ~/.xinitrc

# Install time
sudo pacman -S ntp
sudo systemctl enable ntpd.service

# Misc
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gnome-terminal
sudo pacman -S --noconfirm mumble
sudo pacman -S --noconfirm openssh
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm redshift
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm vlc

sudo yaourt -S --noconfirm spotify

# Enable redshift on boot
sudo systemctl /usr/lib/systemd/user/redshift-gtk.service

# Start ssh-agent
echo "eval $(ssh-agent) &" | tee -a ~/.xinitrc

# Install i3
sudo pacman -S i3
sudo pacman -S dmenu
echo "i3" | tee -a ~/.xinitrc
