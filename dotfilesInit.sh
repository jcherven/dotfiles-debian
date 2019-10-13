#!/bin/bash

set -e
pushd "$HOME"

# Symlinks for files that are located in ~/
# the arrays FILESLOCAL and FILESLINKED correspond by index order
FILESLOCAL=(
  "$HOME/.Xresources"
  "$HOME/.git-prompt.sh"
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.gitconfig"
  "$HOME/.tmux.conf"
)

FILESLINKED=(
  "$HOME/dotfiles-mac/Xresources"
  "$HOME/dotfiles-mac/git-prompt.sh"
  "$HOME/dotfiles-mac/bash_profile"
  "$HOME/dotfiles-mac/bashrc"
  "$HOME/dotfiles-mac/gitconfig"
  "$HOME/dotfiles-mac/tmux.conf"
)

# Symlinks for directories that are located in ~/.config
# the arrays DIRSLOCAL and DIRSLINKED correspond by index order
DIRSLOCAL=(
  "$HOME/.config/ranger"
)

DIRSLINKED=(
  "$HOME/dotfiles-mac/config/ranger"
)

# ~/ dot file symlinks
# requires a c-style loop to access array index numbers
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
  if [ -f "${FILESLOCAL[$i]}" ];
  then
    mv "${FILESLOCAL[$i]}" "${FILESLOCAL[$i]}.default"
  fi
  ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done

# ~/.config directory symlinks
for ((j=0; j<${#DIRSLOCAL[@]}; ++j)); do
  if [ -d "${DIRSLOCAL[$j]}" ]
  then
    mv "${DIRSLOCAL[$j]}" "${DIRSLOCAL[$j]}.default"
  fi
  ln -s "${DIRSLINKED[$j]}" "${DIRSLOCAL[$j]}"
done

NPM_GLOBAL_PACKAGES=(
  eslint
  prettier
  lite-server
  nodemon
)

# yarn + node js

# fonts-iosevka

# Install shellcheck

# Install lynx

# Install ranger

# Install terminator (requires dbus-x11 on WSL for X window usage)

# Install neovim (ubuntu)

# Install vim's plugin deps: cmake, python-dev, build-essential

# Install heroku

yarn global add lite-server nodemon eslint prettier

popd

echo "dotfileInit.sh has completed."

