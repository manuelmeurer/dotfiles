# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bash_profile.pre.bash"

export CLICOLOR="1"
export LSCOLORS="ExFxCxDxBxegedabagacad"
export LESS=-RFX
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RUBY_DEP_GEM_SILENCE_WARNINGS=1

if [ -f "$HOME/.bashrc" ]; then
  source $HOME/.bashrc
fi

###-begin-envkey-completions-###
#
# yargs command completion script
#
# Installation: usr/local/bin/envkey completion >> ~/.zshrc
#    or usr/local/bin/envkey completion >> ~/.zsh_profile on OSX.
#
_envkey_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" usr/local/bin/envkey --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _envkey_yargs_completions envkey
###-end-envkey-completions-###

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/bash_profile.post.bash"
