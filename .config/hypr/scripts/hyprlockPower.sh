#!/bin/bash


if [ -f /sys/class/power_supply/BAT0/status ]; then
  battery_status=$(cat /sys/class/power_supply/BAT0/status)
  if [ "$battery_status" = "Discharging" ]; then
    battery_status="󰁹"
  elif [ "$battery_status" = "Charging" ]; then
    battery_status="󰂄"
  else
    battery_status="󰁹"
  fi
  battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
  echo "$battery_status $battery_percentage%"
else
  battery_status=""
  exit 1
fi

