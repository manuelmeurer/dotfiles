if [ -f $HOME/.git-completion.bash ]; then
  . $HOME/.git-completion.bash
fi

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

if [ -f $HOME/.rvm/scripts/rvm ]; then
  . $HOME/.rvm/scripts/rvm
fi

if [ -f $rvm_path/scripts/completion ]; then
  . $rvm_path/scripts/completion
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH

export AWS_KEY=AKIAI4KUNF7NUV7JXILQ
export AWS_SECRET=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

# \[\033[01;30m\] = black
# \[\033[01;31m\] = red
# \[\033[01;32m\] = green
# \[\033[01;33m\] = yellow
# \[\033[01;34m\] = blue
# \[\033[01;35m\] = pink
# \[\033[01;36m\] = magenta
# \[\033[00m\]    = white

if [ -f $HOME/.rvm/bin/rvm-prompt ]; then
  export PS1='\[\033[01;34m\]\t \[\033[01;32m\]\u@\h \[\033[01;36m\]($(~/.rvm/bin/rvm-prompt i v p g))\[\033[01;32m\] \w$(__git_ps1 "(%s)")\[\033[00m\] '
fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi
