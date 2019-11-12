#!/bin/bash

set -e

function homebrew_bootstrap {
  echo "Bootstrapping jcherven's basic terminal environment via Homebrew"

  if [ -x "$(command -v brew)" ]; then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update

  brew tap caskroom/cask
  brew tap homebrew/cask-versions
  brew tap homebrew/cask-fonts

  brew upgrade --all
  brew cask upgrade --all

  # These are GNU alternatives for the BSD utilities that come with MacOS, which are less up to date and sometimes have less convenient runtime options. Homebrew handles the PATH exports for these on its own.
  brew install perl
  brew install python
  brew install bash
  brew install screen
  brew install binutils
  brew install diffutils
  brew install gawk
  brew install gnutls
  brew install gzip
  brew install watch
  brew install wget
  brew install emacs
  brew install gpatch
  brew install less
  brew install m4
  brew install nano
  brew install file-formula
  brew install git
  brew install openssh
  brew install rsync
  brew install svn
  brew install unzip

  # These are replacements for certain BSD utilities for which Homebrew does not handle the PATH exports. They are handled with aliases in .bashrc.
  brew install coreutils
  brew install findutils
  brew install grep
  brew install gnu-tar
  brew install gnu-which

  # In cases where you don't want to use the GNU version by default because you want the choice to use the BSD version, the commands must be invoked with "ggrep", "gtar", "gmake" and so on.
  brew install gnu-sed
  brew install gnu-indent
  brew install wdiff
  brew install ed
  brew install make


  # These are the most important things you need to get to work quickly.
  brew install pcre
  brew install reattach-to-user-namespace
  brew install readline
  brew install curl
  brew install bash-completion
  brew install tmux
  brew install neovim
  brew install ranger
  brew install w3m
  brew install links
  brew install lynx

  brew cask install font-iosevka
  brew cask install font-iosevka-slab
  brew cask install font-terminus

  brew cask install iterm2
  brew cask install keepassxc
  brew cask install macvim

  # Post-install
  brew cleanup
  brew cask cleanup

  echo "Environment bootstrap via Homebrew has finished."
}

function apt_bootstrap {
  echo "Bootstrapping jcherven's basic terminal environment via apt"
  # Ask for the administrator password upfront
  sudo -v
  # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  # apt update and install commands go here
  sudo apt update

  if [ ! "$(command -v curl)" ]; then
    sudo apt install -y curl
  fi
  sudo apt install -y tmux
  sudo apt install -y neovim
  sudo apt install -y ranger
  sudo apt install -y w3m
  sudo apt install -y links
  sudo apt install -y lynx

  echo "Environment bootstrap via apt has finished."
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  homebrew_bootstrap
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  apt_bootstrap
fi

# ex: set noexpandtab nolist foldmethod=marker:
