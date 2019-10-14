# Environment variable exports
  # Path exports
    # homebrew things
    export PATH=/usr/local/bin:$PATH

    # mongodb things
    export MONGO_PATH=/usr/local/Cellar/mongodb/4.*/bin
    export PATH=$PATH:$MONGO_PATH/bin
    # sql things
    export PATH=/usr/local/mysql/bin:$PATH
  # Set default editor to nvim
  export EDITOR=nvim

#Aliases
  # Always use colored ls output
  if [[ "$OSTYPE" == "linux-gnu"  ]]; then
    alias ls='ls --color'
  elif [[ "$OSTYPE" == "darwin"*  ]]; then
    alias ls='ls -GFh'
  fi

  # Use Neovim if it's installed
  if ! [ -x "$command -v nvim)" ]; then
    alias vim='nvim'
  fi

# Git-friendly command prompt
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
# bash-completion brew package
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# enable vi mode at the prompt
set -o vi

# Case insensitive bash completion
set completion-ignore-case on
set show-all-if-ambiguous on

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
