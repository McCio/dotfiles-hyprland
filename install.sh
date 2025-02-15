read -p "Do you want to install the packages? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  yay -S hyprland hyprpaper hyprlock hypridle waybar swaync kitty xdg-desktop-portal-hyprland wlogout hyprshot battop wob syshud hyprsunset rofi-wayland python-pywal
  yay -S --asdeps ddcutil
  hyprpm add https://github.com/hyprwm/hyprland-plugins
  hyprpm enable hyprexpo
  hyprpm reload
else
  echo "Installation aborted."
  exit 1
fi

# Define a list of strings
folders=("hypr" "kitty" "rofi" "swaync" "sys64" "waybar" "wlogout" "wob")

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
