if [ -d "/usr/local/share/npm/bin" ]; then
  export PATH="/usr/local/share/npm/bin:$PATH"
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

if [ -f "$HOME/.git-completion.bash" ]; then
  . $HOME/.git-completion.bash
fi

if [ -f "/usr/local/etc/bash_completion.d/hub.bash_completion.sh" ]; then
  . /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

if [ -f "$HOME/.bash_aliases" ]; then
  . $HOME/.bash_aliases
fi

export RUBY_GC_MALLOC_LIMIT="60000000"
export RUBY_FREE_MIN="200000"
export GREP_OPTIONS="--color=auto"
export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH"
export LESS=-RFX

if [ -f "$HOME/.git-prompt.sh" ]; then
  . $HOME/.git-prompt.sh
fi

if [ -f "$HOME/.bash_prompt" ]; then
  . $HOME/.bash_prompt
fi

if [ -f "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi
