#!/bin/bash

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

