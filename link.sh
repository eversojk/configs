#!/bin/bash

CWD=$(pwd)

# symlink files here to their destination
sudo ln -sf ${CWD}'/bashrc' ~/.bashrc
sudo ln -sf ${CWD}'/bash_aliases' ~/.bash_aliases
sudo ln -sf ${CWD}'/vimrc' ~/.vimrc
sudo ln -sf ${CWD}'/gitconfig' ~/.gitconfig
sudo ln -sf ${CWD}'/redshift.conf' ~/.config/redshift.conf
sudo ln -sf ${CWD}'/i3_config' ~/.i3/config
sudo ln -sf ${CWD}'/i3status.conf' /etc/i3status.conf
