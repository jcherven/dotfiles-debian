#!/bin/bash

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt update

sudo apt install -y \
  git \
  neovim \
  tmux \
  zip \
  bash-completion \
  curl \
  ;
