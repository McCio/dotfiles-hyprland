#!/bin/bash

BRIGHTNESS=$(brightnessctl i | grep "[0-9]*%" -o | grep "[0-9]*" -o)
echo $BRIGHTNESS >> /tmp/wobpipe