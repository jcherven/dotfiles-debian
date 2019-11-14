# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename '/Users/jums/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# Environment variable exports
  # PATH exports
    # Export these to PATH only on MacOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # Include Homebrew installed packages
        export PATH="/usr/local/bin:$PATH"
        export PATH="/usr/local/sbin:$PATH"

      # GNU coreutils, if you decide to use them instead of the built in BSD utils
      export PATH="$(brew --prefix coreutils)/libexev/gnubin:$PATH"
      # nvm
        export NVM_DIR="$HOME/.nvm"
        # This loads nvm
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        # This loads nvm bash_completion
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

      # yarn
        export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

      # mongodb
        export MONGO_PATH="/usr/local/Cellar/mongodb/4.*/bin"
        export PATH="$PATH:$MONGO_PATH/bin"

      # sql
        export PATH=/usr/local/mysql/bin:$PATH
    fi

  # end PATH exports

  # Prompt configuration
  # Zsh prompt with builtin git branch status export (really slow)
    #autoload -Uz vcs_info
    #precmd_vcs_info() { vcs_info }
    #precmd_functions+=( precmd_vcs_info )
    #setopt prompt_subst
    ##RPROMPT=\$vcs_info_msg_0_
    #PROMPT=\$vcs_info_msg_0_'%# '
    #zstyle ':vcs_info:git:*' formats '%F{magenta}%r%f %F{red}(%b%u)%f '
    #zstyle ':vcs_info:*' enable git
    #export PROMPT='%F{magenta}%n%f %F{yellow}%1~%f %# '

  # Prompt with git contrib's branch status (faster than builtin)
    source "$HOME/dotfiles/git-prompt.sh"
    export GIT_PS1_SHOWDIRTYSTATE=1
    setopt PROMPT_SUBST ; PS1='%F{magenta}%n%f %F{yellow}%c%f%F{red}$(__git_ps1 "(%s)")%f %# '

  # Improved less (and manpage) functionality (GNU less only)
  export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --no-init --window=-8'

  # Set nvim/vim as the default editor if either are installed
  if [ -x "$(command -v nvim)" ]; then
    export EDITOR=nvim
  elif [ -x "$(command -v vim)" ]; then
    export EDITOR=vim
  fi

  # Aliases
    # Improved ls functionality
    # For linux
    if [[ "$OSTYPE" == "linux-gnu"  ]]; then
      alias ls='ls -F -h --color=always -v'
    # For MacOS
    elif [[ "$OSTYPE" == "darwin"*  ]]; then
      if [ -x "$(command -v gls)" ]; then
        # Executes if GNU coreutils is installed
        alias ls='gls -F -h --color=always -v'
      else
        # Executes with stock BSD core utils installed
        alias ls='ls -G -F -h'
      fi
    fi


    # MacOS Only: Use the GNU utils installed in the homebrew bootstrap script instead of the BSD stock utils
    if [[ "$OSTYPE" == "darwin"* ]]; then
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
    fi
  # end Aliases

  # Highlighted man page output in linux and macos.
  # TODO: if GNU less is installed via Homebrew, this section might be handled better via an alias to gless with the correct options
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

