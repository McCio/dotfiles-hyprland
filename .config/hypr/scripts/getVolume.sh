#!/bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
VOLUME_PERCENT=$(echo "$VOLUME * 100" | bc)
VOLUME_PERCENT_INT=$(printf "%.0f" "$VOLUME_PERCENT")
echo $VOLUME_PERCENT_INT >> /tmp/wobpipe

# tail -f /tmp/wobpipe | wob
