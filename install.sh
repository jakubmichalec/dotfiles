#!/bin/bash

echo 'Installing dotfiles'

if [ "$(uname)" == "Darwin"  ]; then
	    echo "Running on OSX"

			echo "Install things with brew"
			source install/brew.sh

			echo "Install terminal stuff"
			source install/terminal.sh

			echo "Install RVM and Ruby"
			source install/rvm_ruby.sh

			echo "Set up Vim"
			source install/vim.sh
fi

echo "Setting up symlinks"
source install/link.sh

echo "Dotfiles installed".
