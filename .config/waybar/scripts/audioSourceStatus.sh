#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_SOURCE@ | awk '{print $2*100}')
node_name=$(wpctl inspect @DEFAULT_SOURCE@ | awk -F'=' '/node.(nick|description)/ {gsub(/\s*"\s*/,"");print $2}' | head -n 1)
muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
if [ "$muted" == "yes" ]
then
  class="muted"
  icon="󰍭"
else
  class="unmuted"
  icon="󰍬"
fi
echo "{\"text\":\"$icon\",\"tooltip\":\"$node_name ${volume}%\",\"percentage\": $volume, \"node_name\": \"$node_name\", \"class\": \"$class\", \"alt\": \"$class\"}"
