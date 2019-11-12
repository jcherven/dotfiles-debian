#!/bin/sh

set -e

if [ "$(command -v nvim)" ]
then
  curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  nvim --headless +PlugInstall +qa
fi

if [ "$(command -v vim)" ]
then
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.vimrc"
  vim -c 'PlugInstall | qa'
fi

