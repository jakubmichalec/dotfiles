#!/bin/bash

DOTFILES=$HOME/dotfiles

echo -e "Creating Symlinks"

linkables=$( find -H "$DOTFILES" -maxdepth 2 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename "${file%.*}")"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo "Create bin folder and place there tat script for TMUX"

if [ ! -e ~/bin ]; then 
	mkdir ~/bin
	cp "$DOTFILES"/bin/tat ~/bin/tat
fi

echo "Done"
