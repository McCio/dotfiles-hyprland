#!/bin/bash

# Check if the system is running on AC power or battery
if grep -q "Charging\|Full" /sys/class/power_supply/*/status; then
  exit 0
else
  exit 1
fi