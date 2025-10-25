#!/bin/zsh

# Create the .config directory if it doesn't exist
if [ ! -d ".config" ]; then
  mkdir .config
fi

. lists.sh

# Loop through each string in the list
for folder in "${folders[@]}"; do
  cp -r ~/.config/$folder ./.config
  # Add your processing logic here
done

cp -r ~/.bin/ ./

# Loop through each string in the list
for file in "${files[@]}"; do
  cp $file ./.config
  # Add your processing logic here
done
