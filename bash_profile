# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && . "$HOME/.fig/shell/bash_profile.pre.bash"
# Fig pre block. Keep at the top of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/bash_profile.pre.bash

export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export LESS=-RFX
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RUBY_DEP_GEM_SILENCE_WARNINGS=1

if [ -f "$HOME/.bashrc" ]; then
  source $HOME/.bashrc
fi

# Fig pre block. Keep at the top of this file.
[ -d $HOME/.fig ] && source $HOME/.fig/shell/bash_profile.post.bash

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && . "$HOME/.fig/shell/bash_profile.post.bash"
