#!/bin/bash

# check if hyprsunset is running

# if --get or -g is passed as an argument, just return if hyprsunset is on or off

if [ "$1" == "--get" ] || [ "$1" == "-g" ]
then
    if pgrep -x "hyprsunset" > /dev/null
    then
        echo "{\"text\":\"\",\"tooltip\":\"Turn hypersunset off\",\"class\":\"on\",\"alt\":\"on\"}"
    else
        echo "{\"text\":\"󰽢\",\"tooltip\":\"Turn hypersunset on\",\"class\":\"off\",\"alt\":\"off\"}"
    fi
    exit 0
fi

if pgrep -x "hyprsunset" > /dev/null
then
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is off\",\"class\":\"off\"}"
    pkill hyprsunset > /dev/null
    # return a json object to be used in waybar
else
    hyprsunset --temperature ${1:-4000k} &
    # return a json object to be used in waybar
    # echo "{\"text\":\"\",\"tooltip\":\"Hyprsunset is on\",\"class\":\"on\"}"
fi
