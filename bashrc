# Fig pre block. Keep at the top of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/bashrc.pre.bash

if hash code 2>/dev/null; then
  export EDITOR="code"
else
  export EDITOR="vim"
fi

if hash rbenv 2>/dev/null; then
  eval "$(rbenv init -)"
fi
if hash scmpuff 2>/dev/null; then
  eval "$(scmpuff init -s)"
fi

[ -f $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.git-prompt.sh ] && source $HOME/.git-prompt.sh
[ -f $HOME/.bash_prompt ] && source $HOME/.bash_prompt
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

if [ -d $HOME/.asdf ]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

# Make git completion work when `git` is aliased to `g`
# http://askubuntu.com/a/62098/63773
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

export GPG_TTY=`tty`

# https://github.com/memkind/memkind/issues/33#issuecomment-648317086
if [[ "$(uname)" == 'Darwin' ]]; then
  alias nproc="sysctl -n hw.logicalcpu"
fi

# https://build.betterup.com/one-weird-trick-that-will-speed-up-your-bundle-install/
export MAKE="make --jobs $(nproc)"

# Fig post block. Keep at the bottom of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/bashrc.post.bash
