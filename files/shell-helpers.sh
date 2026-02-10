source_if_exists() {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

select_editor() {
  if type code > /dev/null 2>&1 && [ -z "$SSH_CONNECTION" ]; then
    export EDITOR="code"
  elif type nvim > /dev/null 2>&1; then
    export EDITOR="nvim"
  elif type vim > /dev/null 2>&1; then
    export EDITOR="vim"
  else
    echo "Warning: no suitable editor found (code, nvim, vim)"
  fi
}

path_prepend_if_exists() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

add_common_dirs_to_path() {
  path_prepend_if_exists "/opt/homebrew/bin"
  path_prepend_if_exists "/opt/homebrew/opt/postgresql@18/bin"
  path_prepend_if_exists "/opt/homebrew/opt/sqlite/bin"
  path_prepend_if_exists "$HOME/.local/bin"
}
