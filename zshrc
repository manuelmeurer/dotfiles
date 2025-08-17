if type code > /dev/null; then
  export EDITOR="code"
else
  export EDITOR="vim"
fi

export PATH="/opt/homebrew/opt/sqlite/bin:/opt/homebrew/opt/postgresql@17/bin:$PATH"

if type brew > /dev/null; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi
if type rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi
if type scmpuff > /dev/null; then
  eval "$(scmpuff init -s)"
fi

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.git-prompt.sh ] && source $HOME/.git-prompt.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && source /opt/homebrew/etc/profile.d/autojump.sh

zstyle ':completion:*' special-dirs true

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

setopt interactivecomments

setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{240}%* %F{yellow}%~%F{cyan}$(__git_ps1)%f %# '

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=`tty`

# https://github.com/memkind/memkind/issues/33#issuecomment-648317086
if [[ "$(uname)" == 'Darwin' ]]; then
  alias nproc="sysctl -n hw.logicalcpu"
fi

# https://build.betterup.com/one-weird-trick-that-will-speed-up-your-bundle-install/
export MAKE="make --jobs $(nproc)"

# https://unix.stackexchange.com/questions/48577/modifying-the-zsh-shell-word-split
WORDCHARS=${WORDCHARS//[\.\/\-_]}

# https://twitter.com/rockatanescu/status/1609518828882628609
RUBY_YJIT_ENABLE=1

# NVM installed via Homebrew
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
