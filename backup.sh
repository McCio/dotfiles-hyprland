#!/bin/bash

cd "$(dirname "$0")"

. lists.sh

mkdir -p .config
mkdir -p .bin

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
