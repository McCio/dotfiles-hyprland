#!/bin/bash

cd "$(dirname "$0")"

. lists.sh

for folder in "${folders[@]}"; do
  diff -r "$HOME/.config/$folder" "./.config/$folder" --color=always | less -F
done

for file in "${files[@]}"; do
  diff "$HOME/$file" "./.config/$file" --color=always | less -F
done
