#!/bin/bash

# Get Vim & Git
sudo apt install update
sudo apt install vim -y

# Directories
mkdir $HOME/.vim
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/colors

wget -P $HOME/.vim/colors/ https://raw.githubusercontent.com/Badacadabra/vim-archery/master/colors/archery.vim
wget -P $HOME/ https://raw.githubusercontent.com/sbyt32/vimrc/main/.vimrc
vim +'PlugInstall --sync' +qa
