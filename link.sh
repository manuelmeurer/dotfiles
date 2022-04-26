#!/usr/bin/env bash

for file in *; do
  if [[ $file = $(basename -- $0) ]]; then
    continue
  fi
  ln -sf "$PWD/$file" "$HOME/.$file"
done
