#!/bin/bash

# Build Wi-Fi list with signal strength
wifi_list=$(nmcli -t -f SSID,SIGNAL,SECURITY dev wifi list |
    awk -F: '
    $1 != "" {
        if ($2 >= 80) icon="󰤨";
        else if ($2 >= 60) icon="󰤥";
        else if ($2 >= 40) icon="󰤢";
        else if ($2 >= 20) icon="󰤟";
        else icon="󰤯";

        printf "%s  %-30s %s%%\n", icon, $1, $2
    }' |
    sort -u)
# Show Rofi menu
selected=$(printf '%s\n' "$wifi_list" |
    rofi -dmenu -i -p "Wi-Fi")

# Cancel
[ -z "$selected" ] && exit 0

# Extract SSID and remove display formatting
ssid=$(echo "$selected" | sed -E 's/^[^ ]+[[:space:]]+//; s/[[:space:]]+[0-9]+%$//')

# Check if network is already saved
if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
    nmcli connection up "$ssid"
    exit 0
fi

# Check security
security=$(nmcli -t -f SSID,SECURITY dev wifi list |
    awk -F: -v s="$ssid" '$1 == s {print $2; exit}')

# Open network
if [ -z "$security" ]; then
    nmcli dev wifi connect "$ssid"
    exit 0
fi

# New secured network — ask for password
password=$(rofi -dmenu -password -p "Password")

[ -z "$password" ] && exit 0

nmcli dev wifi connect "$ssid" password "$password"

