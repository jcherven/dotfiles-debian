#!/bin/bash

set -e

# Listing of Brew Taps
TAPS=(
  "homebrew/cask-versions"
  "homebrew/cask-fonts"
)

# Listing of Brew Formulae
FORMULAE=(
  # These are GNU alternatives for the BSD utilities that come with MacOS, which are less up to date and sometimes have less convenient runtime options. Homebrew handles the PATH exports for these on its own.
  "perl"
  "python"
  "bash"
  "screen"
  "binutils"
  "diffutils"
  "gawk"
  "gnutls"
  "gzip"
  "watch"
  "wget"
  "emacs"
  "gpatch"
  "less"
  "m4"
  "nano"
  "file-formula"
  "git"
  "openssh"
  "rsync"
  "svn"
  "unzip"
  # These are replacements for certain BSD utilities for which Homebrew does not handle the PATH exports. They are handled with aliases in .bashrc.
  "coreutils"
  "findutils"
  "grep"
  "gnu-tar"
  "gnu-which"
  # In cases where you don't want to use the GNU version by default because you want the choice to use the BSD version, the commands must be invoked with "ggrep", "gtar", "gmake" and so on.
  "gnu-sed"
  "gnu-indent"
  "wdiff"
  "ed"
  "make"
  # These are the most important things you need to get to work quickly.
  "reattach-to-user-namespace"
  "readline"
  "curl"
  "bash-completion"
  "tmux"
  "neovim"
  "ranger"
  "w3m"
  "links"
  "lynx"
)

# Listing of Brew Cask Fonts
CASKFONTS=(
  "font-iosevka"
  "font-iosevka-slab"
  "font-terminus"
)

# Listing of Cask GUI Software
CASKSOFTWARE=(
  "iterm2"
  "keepassxc"
  "macvim"
  "vscodium"
  "firefox"
  "firefox-developer-edition"
  "multifirefox"
)

function homebrew_bootstrap {
  echo "Bootstrapping jcherven's basic terminal environment via Homebrew"

  # install brew if it is absent {{{
  if [ ! -x "$(command -v brew)" ]; then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  #}}}

  # Commands to install brew formulae {{{
  # Brew taps
  for ((i=0; i<${#TAPS[@]}; ++i)); do
    brew tap "{TAPS[$i]}"
  done

  # Install Formulae
  for ((j=0; j<${FORMULAE[@]}; ++j)); do
    brew install "{FORMULAE[$j]}"
  done

  # Install Cask Fonts
  for ((k=0; k<${CASKFONTS[@]}; ++k)); do
    brew cask install "{CASKFONTS[$k]}"
  done

  # Install Cask Software
  for ((l=0; l<${CASKSOFTWARE[@]}; ++l)); do
    brew cask install "{CASKSOFTWARE[$l]}"
  done
  #}}}

  # Miscellaneous brew installs that don't fit into the automation above
  brew cask fetch eloston-chromium
  brew cask install eloston-chromium

  # All of the individual install commands {{{
  # Uncomment to revert to working state
  # Then comment the automated install commands in the previous section
  # brew tap homebrew/cask-versions
  # brew tap homebrew/cask-fonts

  # # Brew packages
  # # These are GNU alternatives for the BSD utilities that come with MacOS, which are less up to date and sometimes have less convenient runtime options. Homebrew handles the PATH exports for these on its own.
  # brew install perl
  # brew install python
  # brew install bash
  # brew install screen
  # brew install binutils
  # brew install diffutils
  # brew install gawk
  # brew install gnutls
  # brew install gzip
  # brew install watch
  # brew install wget
  # brew install emacs
  # brew install gpatch
  # brew install less
  # brew install m4
  # brew install nano
  # brew install file-formula
  # brew install git
  # brew install openssh
  # brew install rsync
  # brew install svn
  # brew install unzip

  # # These are replacements for certain BSD utilities for which Homebrew does not handle the PATH exports. They are handled with aliases in .bashrc.
  # brew install coreutils
  # brew install findutils
  # brew install grep
  # brew install gnu-tar
  # brew install gnu-which

  # # In cases where you don't want to use the GNU version by default because you want the choice to use the BSD version, the commands must be invoked with "ggrep", "gtar", "gmake" and so on.
  # brew install gnu-sed
  # brew install gnu-indent
  # brew install wdiff
  # brew install ed
  # brew install make

  # # These are the most important things you need to get to work quickly.
  # brew install reattach-to-user-namespace
  # brew install readline
  # brew install curl
  # brew install bash-completion
  # brew install tmux
  # brew install neovim
  # brew install ranger
  # brew install w3m
  # brew install links
  # brew install lynx

  # # Fonts
  # brew cask install font-iosevka
  # brew cask install font-iosevka-slab
  # brew cask install font-terminus

  # # GUI apps via Cask
  # brew cask install iterm2
  # brew cask install keepassxc
  # brew cask install macvim
  #}}}

  # Post-install
  brew cleanup

  echo "Environment bootstrap via Homebrew has finished."
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! "$(command -v brew)" ]; then
    homebrew_bootstrap
fi

# ex: set foldmethod=marker:
