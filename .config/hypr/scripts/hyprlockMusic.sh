#!/bin/bash

# Check if player is running
if ! playerctl status &>/dev/null; then
  echo ""
  rm -f /tmp/playerctl-cover.jpg
  exit
fi

# Parse parameter
if [[ $1 == "status" ]]; then
  status=$(playerctl status)
  if [[ $status == "Paused" ]]; then
    echo ""
  else
    echo ""
  fi
  exit
fi

if [[ $1 == "artist" ]]; then
  artist=$(playerctl metadata artist)
  echo "$artist"
  exit
fi

art_url=$(playerctl metadata mpris:artUrl 2>/dev/null)
current_album=$(playerctl metadata album 2>/dev/null)
if [[ $art_url != "No players found" &&  $current_album != $(cat /tmp/playerctl-album.txt 2>/dev/null) ]]; then
  if [[ $art_url == http* ]]; then
    wget -q -O /tmp/playerctl-cover.jpg "$art_url"  # download the album cover
  else 
    cp ~/.config/hypr/scripts/music-placeholder.jpg /tmp/playerctl-cover.jpg # put a placeholder image
  fi
  echo "$current_album" > /tmp/playerctl-album.txt
fi

echo "<span><b><big>$(playerctl metadata title)</big></b></span>"
