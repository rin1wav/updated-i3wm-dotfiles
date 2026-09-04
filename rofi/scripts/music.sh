#!/bin/bash

CACHE="$HOME/.cache/rofi"
ART="$CACHE/album-art.jpg"

status=$(playerctl status 2>/dev/null)

if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
    echo "No music playing"
    exit 0
fi

artist=$(playerctl metadata --format '{{artist}}' 2>/dev/null)
title=$(playerctl metadata --format '{{title}}' 2>/dev/null)
album=$(playerctl metadata --format '{{album}}' 2>/dev/null)
arturl=$(playerctl metadata --format '{{mpris:artUrl}}' 2>/dev/null)

# Download album art
if [[ "$arturl" == http* ]]; then
    curl -L -s --max-time 5 "$arturl" -o "$ART"
elif [[ "$arturl" == file://* ]]; then
    cp "${arturl#file://}" "$ART" 2>/dev/null
elif [[ -f "$arturl" ]]; then
    cp "$arturl" "$ART" 2>/dev/null
fi

# Fallback image
if [ ! -s "$ART" ]; then
    ART="$HOME/.config/rofi/scripts/default-cover.png"
fi

case "$1" in
    play)
        playerctl play-pause
        exit 0
        ;;
    next)
        playerctl next
        exit 0
        ;;
    previous)
        playerctl previous
        exit 0
        ;;
esac

# Rofi rows
echo -e "󰎆  $title\0icon\x1f$ART"
echo -e "   $artist • $album\0icon\x1f$ART"
echo -e "󰒮  Previous\0icon\x1f$ART"
echo -e "󰏤  Play / Pause\0icon\x1f$ART"
echo -e "󰒭  Next\0icon\x1f$ART"
