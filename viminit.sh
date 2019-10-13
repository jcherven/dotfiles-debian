#!/bin/sh

set -e

brew install curl

curl -fLo "$HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo "$HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/dotfiles-mac/config/nvim/init.vim" "$HOME/.vimrc"

nvim --headless +PlugInstall +qa
vim -c 'PlugInstall | qa'

