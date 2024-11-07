#!/bin/bash 

if [ -f ~/.config/waybar/style-dark.css.disabled ]; then
  mv ~/.config/waybar/style-dark.css.disabled ~/.config/waybar/style-dark.css
else
  mv ~/.config/waybar/style-dark.css ~/.config/waybar/style-dark.css.disabled
fi

~/.config/hypr/scripts/restart-waybar.sh