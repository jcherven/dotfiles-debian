#!/bin/sh

set -e

echo "Bootstrapping Homebrew with jcherven's basic terminal environment"

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap caskroom/cask
brew tap homebrew/cask-fonts

brew upgrade --all
brew cask upgrade --all

brew install curl
brew install bash-completion
brew install neovim
brew install ranger
brew install tmux
brew install pcre
brew install reattach-to-user-namespace
brew install readline
brew install w3m
brew install links
brew install lynx

brew cask install font-iosevka
brew cask install font-iosevka-slab
brew cask install font-terminus

brew cask install iterm2
brew cask install keepassxc
brew cask install macvim

brew cleanup
brew cask cleanup
