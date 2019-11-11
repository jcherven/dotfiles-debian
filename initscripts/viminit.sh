#!/bin/sh

set -e

curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.vimrc"

if [ "$(command -v nvim)" ]
then
  nvim --headless +PlugInstall +qa
fi

vim -c 'PlugInstall | qa'

