#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

WIFI_SSID="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
POWER_STATUS="$(networksetup -getairportpower en0 | grep -owh "On")"

if [ -z "$POWER_STATUS" ]; then
    sketchybar -m --set $NAME   icon=$WIFI_OFF              \
                                icon.color=$WHITE           \
                                label.padding_right=2
    LABEL=""
elif [ -z "$WIFI_SSID" ]; then
    sketchybar -m --set $NAME   icon=$WIFI_DISCONNECTED     \
                                icon.color=$WHITE           \
                                label.padding_right=2
    LABEL=""
else
    sketchybar -m --set $NAME   icon=$WIFI_CONNECTED        \
                                icon.color=$GREEN           \
                                label.padding_right=4
    LABEL="$WIFI_SSID"
fi

sketchybar -m --set $NAME label="$LABEL"

