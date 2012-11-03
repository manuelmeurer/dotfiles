if [ -f $HOME/.git-completion.bash ]; then
  . $HOME/.git-completion.bash
fi

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH

# \[\033[01;30m\] = black
# \[\033[01;31m\] = red
# \[\033[01;32m\] = green
# \[\033[01;33m\] = yellow
# \[\033[01;34m\] = blue
# \[\033[01;35m\] = pink
# \[\033[01;36m\] = magenta
# \[\033[00m\]    = white

export PS1='\[\033[01;34m\]\t \[\033[01;32m\]\u@\h \[\033[01;32m\] \w$(__git_ps1 "(%s)")\[\033[00m\] '

[ -s "/Users/manuel/.scm_breeze/scm_breeze.sh" ] && source "/Users/manuel/.scm_breeze/scm_breeze.sh"

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi
