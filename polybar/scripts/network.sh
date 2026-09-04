#!/bin/bash

interface=$(ip route | awk '/default/ {print $5; exit}')

if [ -z "$interface" ]; then
    echo "󰤭 Offline"
    exit
fi

if [[ "$interface" == wl* ]]; then

    signal=$(iw dev "$interface" link 2>/dev/null |
        awk '/signal:/ {print $2; exit}')

    if [ -z "$signal" ]; then
        echo "󰤯"
        exit
    fi

    # Convert dBm to a rough percentage
    if [ "$signal" -ge -50 ]; then
        echo "󰤨"
    elif [ "$signal" -ge -60 ]; then
        echo "󰤥"
    elif [ "$signal" -ge -70 ]; then
        echo "󰤢"
    elif [ "$signal" -ge -80 ]; then
        echo "󰤟"
    else
        echo "󰤯"
    fi

else
    echo "󰈀 Ethernet"
fi
