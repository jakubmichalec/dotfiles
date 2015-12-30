#!/bin/sh
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

packages=(tree
          wget
          openssl
          vim
          git
          tmux
          cmake
          'macvim --override-system-vim'
          reattach-to-user-namespace
          cmake)


for pack in "${packages[@]}"
do 
  brew_install_or_upgrade $pack
done

fancy_echo 'Linking'
brew link cmake
brew unlink openssl && brew link openssl --force

