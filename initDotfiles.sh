#!/bin/bash

set -e

# Some setup of directories that will be used by dotfiles
# Listing of directories needed by dotfiles. Add new needed entries to this array.
DIRECTORIES=(
  # directories needed in ~/.config
  "$HOME/.config/nvim"
  "$HOME/.config/ranger"
  "$HOME/.config/git"
  )

# Create directories defined in DIRECTORIES array. Requires /bin/bash for C-style looping to access array indexes {{{
for ((j=0; j<${#DIRSLOCAL[@]}; ++j)); do
  if [ ! -d "${DIRSLOCAL[$j]}" ]; then
    mkdir -p "${DIRSLOCAL[$j]}"
  fi
done
#}}}

# Symlinked files
# Listing of symlinks for files that are located in ~/
FILESLOCAL=( # items correspond  to FILESLINKED by index order
  # Xorg configs
  "$HOME/.Xresources"
  # bash and other shell configs
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.inputrc"
  "$HOME/.zshrc"
  # tmux
  "$HOME/.tmux.conf"
  # git global configs
  "$HOME/.config/git/config"
  "$HOME/.config/git/ignore"
  "$HOME/.config/git/git-completion.bash"
  "$HOME/.config/git/git-prompt.sh"
  # other applications
  "$HOME/.config/ranger/rc.conf"
  "$HOME/.config/ranger/rifle.conf"
)

FILESLINKED=(
  # Xorg configs
  "$HOME/dotfiles/Xresources"
  # bash and other shell configs
  "$HOME/dotfiles/bash_profile"
  "$HOME/dotfiles/bashrc"
  "$HOME/dotfiles/inputrc"
  "$HOME/dotfiles/zshrc"
  # tmux
  "$HOME/dotfiles/tmux.conf"
  # git global configs
  "$HOME/dotfiles/config/git/config"
  "$HOME/dotfiles/config/git/ignore"
  "$HOME/dotfiles/config/git/git-completion.bash"
  "$HOME/dotfiles/config/git/git-prompt.sh"
  # other applications
  "$HOME/dotfiles/config/ranger/rc.conf"
  "$HOME/dotfiles/config/ranger/rifle.conf"
)

# Create required directories specified in DIRECTORIES
for ((j=0; j<${#DIRECTORIES[@]}; ++j)); do
  mkdir -p "${DIRECTORIES[$j]}"
done

# Call software bootstrap install/config scripts {{{
# Install the OS's basic environment bootstrap apps (currently supports MacOS)
source "$HOME/dotfiles/initscripts/swbootstrap.sh"

# Install vim-plug and bootstrap the vim/neovim environment
source "$HOME/dotfiles/initscripts/viminit.sh"

# # Set preferred MacOS settings
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   source "$HOME/dotfiles/initscripts/macosinit.sh"
# fi
#}}}

# Set the ~/ dot file symlinks defined in FILESLINKED {{{
# requires a c-style loop to access array index numbers
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
  if [ -e "${FILESLOCAL[$i]}" ];
  then
    mv "${FILESLOCAL[$i]}" "${FILESLOCAL[$i]}.old"
  fi
  ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done
#}}}

echo "initDotfiles.sh has completed."

# ex: set foldmethod=marker
