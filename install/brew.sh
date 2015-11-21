if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

brew install tree
brew install wget

# development

brew install vim
brew install git
brew install macvim --override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install cmake
brew link cmake

