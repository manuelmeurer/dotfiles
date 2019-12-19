export EDITOR="subl -w"
export GOPATH=$HOME/go
export PATH="/usr/local/sbin:$GOPATH/bin:$PATH"

# https://github.com/rails/spring/issues/606
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

eval "$(rbenv init -)"
eval "$(scmpuff init -s)"

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
