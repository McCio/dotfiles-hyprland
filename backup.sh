#!/bin/zsh

# Create the .config directory if it doesn't exist
if [ ! -d ".config" ]; then
  mkdir .config
fi

# Define a list of strings
folders=("wofi" "hypr" "waybar" "kitty" "swaync" "wlogout")

# Define a list of files
files=("$HOME/.zshrc")

# Loop through each string in the list
for folder in "${folders[@]}"; do
  cp -r ~/.config/$folder ./.config
  # Add your processing logic here
done


# Loop through each string in the list
for file in "${files[@]}"; do
  cp $file ./.config
  # Add your processing logic here
done

