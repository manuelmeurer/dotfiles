if type code > /dev/null; then
  export EDITOR="code"
else
  export EDITOR="vim"
fi

export GOPATH=$HOME/go
export PATH="/usr/local/sbin:$GOPATH/bin:$PATH"

# https://github.com/rails/spring/issues/606
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

if type brew > /dev/null; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi
if type rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi
if type scmpuff > /dev/null; then
  eval "$(scmpuff init -s)"
fi

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.git-prompt.sh ] && source $HOME/.git-prompt.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

zstyle ':completion:*' special-dirs true

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{240}%* %F{yellow}%~%F{cyan}$(__git_ps1)%f %# '

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=`tty`
