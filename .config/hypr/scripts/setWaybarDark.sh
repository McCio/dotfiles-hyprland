#!/bin/bash 

if [ -f ~/.config/waybar/style-dark.css.disabled ]; then
  mv ~/.config/waybar/style-dark.css.disabled ~/.config/waybar/style-dark.css
  cp ~/.config/hypr/wallpaper/wallpaper-dark ~/.config/hypr/wallpaper/wallpaper
else
  mv ~/.config/waybar/style-dark.css ~/.config/waybar/style-dark.css.disabled
  cp ~/.config/hypr/wallpaper/wallpaper-light ~/.config/hypr/wallpaper/wallpaper
fi

~/.config/hypr/scripts/restart-waybar.sh
~/.config/hypr/scripts/restart-hyprpaper.sh
