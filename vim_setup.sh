#!/bin/bash

# Get Vim & Git
sudo apt -qq update > /dev/null 2>&1
sudo apt -qq install git vim -y
echo "Installed the basics: Vim and Git"

# Directories
mkdir $HOME/.vim
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/colors
mkdir $HOME/.vim/autoload

if test -f "$HOME/.vimrc"; then
    echo "Removing existing .vimrc"
    rm $HOME/.vimrc
fi
cd $HOME

# Grab stuff I can't grab from vim-plug and vim-plug itself
wget -qP $HOME/.vim/colors/ https://raw.githubusercontent.com/Badacadabra/vim-archery/master/colors/archery.vim
echo "Grabbed Archery (colorscheme)"
wget -qP $HOME/ https://raw.githubusercontent.com/sbyt32/vimrc/main/.vimrc
echo "Grabbed .vimrc file from GitHub"
wget -qP $HOME/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Grabbed vim-plug from GitHub"

# NodeJS
if ! dpkg --get-selections | grep -q "^nodejs[[:space:]]*install$"; then
    echo "Missing NodeJS, downloading..."
    wget -q https://deb.nodesource.com/setup_19.x > /dev/null 2>&1
    sudo -E bash ./setup_19.x > /dev/null 2>&1 
    sudo apt -qq install -y nodejs
    echo "Installed NodeJS"
fi


# Vim Plugins
vim +'source .vimrc' +'PlugInstall --sync' +qa
vim +'source .vimrc' +'CocInstall coc-tsserver coc-pyright coc-json coc-sh' +qa

echo "Vim should be ready!"
