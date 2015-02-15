#!/bin/bash

sudo pacman -Syu

# disable pc speaker
echo "blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

sudo pacman -S --noconfirm zip unzip

mkdir -p ~/.config
mkdir -p ~/.i3
curl -L -O https://github.com/eversojk/scripts/archive/master.zip
unzip master.zip
cp scripts-master/bash_aliases ~/.bash_aliases
cp scripts-master/bashrc ~/.bashrc
cp scripts-master/gitconfig ~/.gitconfig
cp scripts-master/vimrc ~/.vimrc
cp scripts-master/redshift.conf ~/.config/
sudo cp scripts-master/i3status.conf /etc/
sudo cp scripts-master/i3_config ~/.i3/config
sudo cp scripts-master/fonts.conf /etc/fonts/local.conf
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

rm -r ~/builds

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
# Load nvidia config and set graphics card to max performance
echo "nvidia-settings --load-config-only -a [gpu:0]/GpuPowerMizerMode=1 &" | tee -a ~/.xinitrc
# write xorg.conf
sudo nvidia-xconfig

# Install sound
sudo pacman -S --noconfirm pulseaudio
sudo pacman -S --noconfirm pulseaudio-alsa
sudo pacman -S --noconfirm alsa-utils
echo "start-pulseaudio-x11 &" | tee -a ~/.xinitrc
echo "amixer sset Master unmute &" | tee -a ~/.xinitrc

# Install time
sudo pacman -S --noconfirm ntp
sudo systemctl enable ntpd.service

# Misc
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gnome-terminal
sudo pacman -S --noconfirm mumble
sudo pacman -S --noconfirm openssh
sudo pacman -S --noconfirm python-pip
# redshift dependencies
sudo pacman -S --noconfirm python-gobject
sudo pacman -S --noconfirm python-xdg
sudo pacman -S --noconfirm librsvg
sudo pacman -S --noconfirm redshift
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm vlc

yaourt -S --noconfirm spotify
yaourt -S --noconfirm google-chrome

# Enable redshift on boot
echo "redshift-gtk &" | tee -a ~/.xinitrc

# Start ssh-agent
echo "eval \`ssh-agent\`" | tee -a ~/.xinitrc

# Install i3
sudo pacman -S --noconfirm i3
sudo pacman -S --noconfirm dmenu
echo "i3" | tee -a ~/.xinitrc

# Disable mouse acceleration in X
echo 'Section "InputClass"
    Identifier "My Mouse"
    MatchIsPointer "yes"
    Option "AccelerationProfile" "-1"
    Option "AccelerationScheme" "none"
EndSection' | sudo tee -a "/etc/X11/xorg.conf.d/50-mouse-acceleration.conf"

# fonts
# korean
sudo pacman -S --noconfirm ttf-baekmuk
