#!/bin/bash


device_name=$(bluetoothctl devices Connected | awk -F ' ' '{print $3, $4, $5}')
names=$(echo "$device_name" | awk '{printf "%s- ", $0} END {print ""}' | sed 's/- $//')

if [ -n "$device_name" ]; then
  echo "󰂯  $names"
else
  echo "󰂲  No devices"
fi
