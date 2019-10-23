export EDITOR="subl -w"

eval "$(rbenv init -)"
eval "$(scmpuff init -s)"

. $HOME/.git-completion.bash
. $HOME/.aliases
. $HOME/.git-prompt.sh
. $HOME/.bash_prompt

# Make git completion work when `git` is aliased to `g`
# http://askubuntu.com/a/62098/63773
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g
