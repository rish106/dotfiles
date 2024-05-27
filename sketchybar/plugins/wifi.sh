#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

airport="$(networksetup -getairportnetwork en0)"
POWER_STATUS="$(echo "$airport" | grep "Wi-Fi power is currently off." )"
CONNECT_STATUS="$(echo "$airport" | grep "You are not associated with an AirPort network.")"

if [ ! -z "$POWER_STATUS" ]; then
    sketchybar -m --set $NAME   icon=$WIFI_OFF              \
                                icon.color=$WHITE           \
                                label.padding_right=2
    LABEL=""
elif [ ! -z "$CONNECT_STATUS" ]; then
    sketchybar -m --set $NAME   icon=$WIFI_DISCONNECTED     \
                                icon.color=$WHITE           \
                                label.padding_right=2
    LABEL=""
else
    sketchybar -m --set $NAME   icon=$WIFI_CONNECTED        \
                                icon.color=$GREEN           \
                                label.padding_right=4
    LABEL=$(echo "$airport" | cut -c 24-)
fi

sketchybar -m --set $NAME label="$LABEL"

