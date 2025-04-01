#!/bin/bash

connection_info=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes')
connection_name=$(echo "$connection_info" | cut -d: -f2)
signal_strength=$(echo "$connection_info" | cut -d: -f3)

low="󰤟"
medium="󰤢"
high="󰤥"
full="󰤨"

if [ "$signal_strength" -ge 75 ]; then
  icon=$full
elif [ "$signal_strength" -ge 50 ]; then
  icon=$high
elif [ "$signal_strength" -ge 25 ]; then
  icon=$medium
else
  icon=$low
fi

if [ -n "$connection_name" ]; then
  echo "$icon  $connection_name"
else
  echo "󱞐  Offline"
fi

