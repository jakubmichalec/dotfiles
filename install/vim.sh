#!/bin/bash

echo "Install vundle for manage Vim Plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

ln -s /usr/local/bin/mvim vim

sudo chown -R $USER /usr/local

cd ~/.vim/bundle/YouCompleteMe
./install.py
