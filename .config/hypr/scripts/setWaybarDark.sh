#!/bin/bash 

if [ -f ~/.config/waybar/style-dark.css.disabled ]; then
  mv ~/.config/waybar/style-dark.css.disabled ~/.config/waybar/style-dark.css
  ~/.local/bin/set-background ~/.config/hypr/wallpaper/wallpaper-dark
else
  mv ~/.config/waybar/style-dark.css ~/.config/waybar/style-dark.css.disabled
  ~/.local/bin/set-background ~/.config/hypr/wallpaper/wallpaper-light
fi

~/.config/hypr/scripts/restart-waybar.sh
~/.config/hypr/scripts/restart-hyprpaper.sh
