#!/bin/bash

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

[ -z "$artist" ] && artist="Unknown Artist"
[ -z "$title" ] && title="Nothing Playing"

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    play_icon="⏸  Pause"
else
    play_icon="▶  Play"
fi

shuffle=$(playerctl shuffle 2>/dev/null)

if [ "$shuffle" = "true" ]; then
    shuffle_icon="󰒝  Shuffle: On"
else
    shuffle_icon="󰒝  Shuffle: Off"
fi

choice=$(printf '%s\n' \
    "$play_icon" \
    "󰒭  Previous" \
    "󰒮  Next" \
    "$shuffle_icon" \
    "󰑋  Stop" \
    | rofi \
        -dmenu \
        -i \
        -p "♫  $artist — $title" \
        -mesg "♫  $artist — $title" \
        -theme ~/.config/rofi/music.rasi)

case "$choice" in
    "$play_icon")
        playerctl play-pause
        ;;
    "󰒭  Previous")
        playerctl previous
        ;;
    "󰒮  Next")
        playerctl next
        ;;
    "$shuffle_icon")
        if [ "$shuffle" = "true" ]; then
            playerctl shuffle false
        else
            playerctl shuffle true
        fi
        ;;
    "󰑋  Stop")
        playerctl stop
        ;;
esac
