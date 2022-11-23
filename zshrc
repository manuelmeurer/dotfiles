# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/zshrc.pre.zsh

if type code > /dev/null; then
  export EDITOR="code"
else
  export EDITOR="vim"
fi

export PATH="/opt/homebrew/opt/node@16/bin:/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"

# https://github.com/rails/spring/issues/606
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

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

# Fig post block. Keep at the bottom of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/zshrc.post.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
