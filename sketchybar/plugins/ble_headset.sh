#!/usr/bin/env bash

update () {
    DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headset") | keys[]')

    if [ -z "$DEVICES" ]; then
        sketchybar -m --set headphones icon.drawing=off
    else
        sketchybar -m --set headphones icon.drawing=on
        sketchybar -m --set headset_name label.drawing=on label="$(echo "$DEVICES" | tr -d '"')"
    fi
}

popup () {
    sketchybar -m --set headphones popup.drawing=$1
}

case "$SENDER" in
    "mouse.entered") popup on
    ;;
    "mouse.exited"|"mouse.exited.global") popup off
    ;;
    *) update
    ;;
esac
