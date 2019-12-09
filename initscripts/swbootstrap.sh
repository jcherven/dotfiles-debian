#!/bin/bash

set -e

# Listing of Brew Taps
TAPS=(
  "homebrew/cask-versions"
  "homebrew/cask-fonts"
)

# Listing of Brew Formulae
FORMULAE=(
  # These are GNU alternatives for the BSD utilities that come with MacOS, which are more up to date and sometimes have more convenient command line options. Homebrew handles the PATH exports for these on its own.
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

# Listing of Casks that need to be fetched manually for installation
FETCHEDCASKS=(
  "eloston-chromium"
)

function homebrew_bootstrap {
  echo "Bootstrapping jcherven's basic MacOS terminal environment via Homebrew"

  # install brew if it is absent {{{
  if [ ! -x "$(command -v brew)" ]; then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew update
  #}}}

  # Commands to install brew formulae {{{
  # Brew taps
  echo
  echo "Installing required Homebrew Taps:"
  for ((i=0; i<${#TAPS[@]}; ++i)); do
    brew tap "${TAPS[$i]}"
  done

  # Install Formulae
  echo
  echo "Installing terminal tools (Formulae):"
  for ((j=0; j<${FORMULAE[@]}; ++j)); do
    brew install "${FORMULAE[$j]}"
  done

  # Install Cask Fonts
  echo
  echo "Installing Fonts (Casks):"
  for ((k=0; k<${CASKFONTS[@]}; ++k)); do
    brew cask install "${CASKFONTS[$k]}"
  done

  # Install Cask Software
  echo
  echo "Installing GUI apps (Casks):"
  for ((l=0; l<${CASKSOFTWARE[@]}; ++l)); do
    brew cask install "${CASKSOFTWARE[$l]}"
  done

  # Install Fetched Cask apps
  echo
  echo "Installing Fetched GUI apps (Casks):"
  for ((m=0; m<${FETCHEDCASKS[@]}; ++m)); do
    brew cask install "${FETCHEDCASKS[m]}"
  done
  #}}}

  # Post-install
  brew cleanup

  echo "Environment bootstrap via Homebrew has finished."
}

function install_nvm {
  # Install Nodejs via NVM
  # https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/
  if [ ! -x "$(command -v nvm)" ]; then
    echo "Installing NVM via Git"
    export NVM_DIR="$HOME/.nvm" && (
      git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
      pushd "$NVM_DIR"
      # Suppress Git's detached HEAD message
      git config advice.detachedHead false
      git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
    ) && \. "$NVM_DIR/nvm.sh"
  fi
}

# Install Homebrew and basic apps via function
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! -x "$(command -v brew)" ]; then
    homebrew_bootstrap
  fi
fi

# Install nvm via function
if [[ "$OSTYPE" == "darwin"* ]]; then
  install_nvm
  echo "The NVM installation requires a restart of the terminal."
  echo "After restarting the terminal, run the ~/dotfiles/initNodejs.sh script."
fi

# ex: set foldmethod=marker:
