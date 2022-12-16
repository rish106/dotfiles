#!/usr/bin/env bash

update () {
    DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headset") | keys[]')

    if [ "$DEVICES" = "" ]; then
        sketchybar --set $NAME drawing=off
    else
        sketchybar --set $NAME drawing=on
        sketchybar --set headset_name label.drawing=on label="$(echo "$DEVICES" | tr -d '"')"
    fi
}

popup () {
    sketchybar --set headphones popup.drawing=$1
}

case "$SENDER" in
    "mouse.entered") popup on
    ;;
    "mouse.exited"|"mouse.exited.global") popup off
    ;;
    *) update
    ;;
esac
