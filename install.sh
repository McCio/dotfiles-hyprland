read -p "Do you want to install the packages? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  sudo pacman -S hyprland hyprpaper hyprlock hypridle waybar wofi swaync kitty
  yay -S wlogout hyprshot
else
  echo "Installation aborted."
fi

# Define a list of strings
folders=("wofi" "hypr" "waybar" "kitty")

# Define a list of files
files=(".zshrc")

# Loop through each string in the list
for folder in "${folders[@]}"; do
  cp -r ./.config/$folder ./test 
  # Add your processing logic here
done


# Loop through each string in the list
for file in "${files[@]}"; do
  cp ./.config/$file ./test/ 
  # Add your processing logic here
done
