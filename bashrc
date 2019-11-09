# ~/dotfiles-mac/bashrc
# Symlink this file from ~ or dump it in and rename to .bashrc

# This version of the .bashrc is only tested on MacOS with the intention of working towards portability.

# Right now .bashrc is for env variable exports, aliases and the prompt configuration.

# Environment variable exports
  # PATH exports
    # Include Homebrew installed packages
    export PATH="/usr/local/bin:$PATH"

    # GNU coreutils, if you decide to use them instead of the built in BSD utils
    export PATH="$(brew --prefix coreutils)/libexev/gnubin:$PATH"

    # mongodb
    export MONGO_PATH=/usr/local/Cellar/mongodb/4.*/bin
    export PATH=$PATH:$MONGO_PATH/bin

    # sql
    export PATH=/usr/local/mysql/bin:$PATH

    # yarn
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  # end PATH exports

  export EDITOR=nvim

#Aliases
  # Improved ls functionality; handling for GNU ls and BSD ls
  if [[ "$OSTYPE" == "linux-gnu"  ]]; then
    alias ls='ls -F -h --color=always -v'
  elif [[ "$OSTYPE" == "darwin"*  ]]; then
    if [ -x "$(command -v gls)" ]; then
      # Executes if GNU coreutils is installed
      alias ls='gls -F -h --color=always -v'
    else
      # Executes with stock BSD core utils installed
      alias ls='ls -G -F -h'
    fi
  fi

  # Use the GNU utils installed in the homebrew bootstrap script instead of the BSD stock utils
  if ! [ -x "$(command -v gfind)" ]; then
    alias find='gfind'
  fi

  if ! [ -x "$(command -v ggrep)" ]; then
    alias grep='ggrep'
  fi

  if ! [ -x "$(command -v gtar)" ]; then
    alias tar='gtar'
  fi

  if ! [ -x "$(command -v gwhich)" ]; then
    alias which='gwhich'
  fi

  # Use Neovim if it's installed
  if ! [ -x "$(command -v nvim)" ]; then
    alias vim='nvim'
  fi

# Decorated prompt with Git status
# TODO: .git-prompt.sh is possibly badly outdated, think about looking into a newer one
  source ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1

  # Git prompt color definitions
  # Grab terminal colors
  green="\[\033[0;32m\]"
  blue="\[\033[0;34m\]"
  purple="\[\033[0;35m\]"
  # reset for normal colored command input
  reset="\[\033[0m\]"
  export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

# Highlighted man page output in linux and macos.
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man $@
}

# Tab completion via Homebrew package
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

