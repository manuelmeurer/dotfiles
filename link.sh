#!/usr/bin/env bash

for file in *; do
  if [[ $file =~ .+\.sublime.+ ]] || [[ $file = $(basename -- $0) ]]; then
    continue
  fi
  ln -sf "$PWD/$file" "~/.$file"
done
