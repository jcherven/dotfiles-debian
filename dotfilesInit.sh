#!/bin/bash

set -e
pushd "$HOME"

# Install the OS's basic environment bootstrap apps (currently supports MacOS and Debian)
#source "$HOME/dotfiles/initscripts/swbootstrap.sh"

# Symlinks for files that are located in ~/
# the arrays FILESLOCAL and FILESLINKED correspond by index order
FILESLOCAL=(
  "$HOME/.Xresources"
  "$HOME/.git-prompt.sh"
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.inputrc"
  "$HOME/.tmux.conf"
  "$HOME/.config/ranger/rc.conf"
  "$HOME/.config/ranger/rifle.conf"
)

FILESLINKED=(
  "$HOME/dotfiles/Xresources"
  "$HOME/dotfiles/git-prompt.sh"
  "$HOME/dotfiles/bash_profile"
  "$HOME/dotfiles/bashrc"
  "$HOME/dotfiles/inputrc"
  "$HOME/dotfiles/tmux.conf"
  "$HOME/dotfiles/config/ranger/rc.conf"
  "$HOME/dotfiles/config/ranger/rifle.conf"
)

# Symlinks for directories that are located ~/
# the arrays DIRSLOCAL and DIRSLINKED correspond by index order
DIRSLOCAL=(
  "$HOME/.config/git"
)

DIRSLINKED=(
  "$HOME/dotfiles/config/git"
)

# ~/ dot file symlinks
# requires a c-style loops to access array index numbers
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
  if [ -f "${FILESLOCAL[$i]}" ];
  then
    mv "${FILESLOCAL[$i]}" "${FILESLOCAL[$i]}.old"
  fi
  ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done

# ~/.config directory symlinks
for ((j=0; j<${#DIRSLOCAL[@]}; ++j)); do
  if [ ! -d "${DIRSLOCAL[$j]}" ]
  then
    mkdir "${DIRSLOCAL[$j]}"
  fi
  if [ -d "${DIRSLOCAL[$j]}" ]
  then
    mv "${DIRSLOCAL[$j]}" "${DIRSLOCAL[$j]}.old"
  fi
  ln -s "${DIRSLINKED[$j]}" "${DIRSLOCAL[$j]}"
done

# Install vim-plug and bootstrap the vim/neovim environment
source "$HOME/dotfiles/initscripts/viminit.sh"

# Set preferred MacOS settings
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   source "$HOME/dotfiles/initscripts/macosinit.sh"
# fi

popd

echo "dotfileInit.sh has completed."
#echo "Manual steps left to complete:"
#echo "  - Go set iTerm2 to read your custom preferences from the dotfiles version"
#echo "  - Log out and back in to set MacOS system settings changes"

