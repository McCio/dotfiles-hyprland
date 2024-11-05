#!/bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
VOLUME_PERCENT=$(echo "$VOLUME * 100" | bc)
VOLUME_PERCENT_INT=$(printf "%.0f" "$VOLUME_PERCENT")
echo $VOLUME_PERCENT_INT >> /tmp/wobpipe

mpv /usr/share/sounds/gnome/default/alerts/click.ogg
# mpv ~/.config/hypr/sounds/water_drop.opus
# tail -f /tmp/wobpipe | wob
