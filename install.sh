read -p "Do you want to install the packages? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  sudo pacman -S hyprland hyprpaper hyprlock hypridle waybar wofi swaync kitty xdg-desktop-portal-hyprland
  yay -S wlogout hyprshot battop wob
else
  echo "Installation aborted."
fi

# Define a list of strings
folders=("wofi" "hypr" "waybar" "kitty" "rofi" "swaync" "sys64" "waybar" "wlogout")

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
