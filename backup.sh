#!/bin/bash

# Define a list of strings
strings=("hypr" "wofi" "waybar" "kitty")

# Loop through each string in the list
for str in "${strings[@]}"; do
  cp -r ~/.config/$str ./.config
  # Add your processing logic here
done

cp ~/.zshrc .config