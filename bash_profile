if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/sbin:$PATH"

##
# Your previous /Users/choro/.bash_profile file was backed up as /Users/choro/.bash_profile.macports-saved_2019-10-12_at_02:57:54
##

# MacPorts Installer addition on 2019-10-12_at_02:57:54: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

