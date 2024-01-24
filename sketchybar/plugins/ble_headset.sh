#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"

update () {

    BLUETOOTH_STATE=$(blueutil -p)

    if [[ $BLUETOOTH_STATE -eq 0 ]]; then
        sketchybar -m --set headphones icon.drawing=off
    else
        DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headset") | keys[]')

        if [ -z "$DEVICES" ]; then
            sketchybar -m --set headphones icon.drawing=on \
                                           icon=$BLUETOOTH_ON \
                                           icon.font.size=17.0 \
                                           popup.drawing=off
        else
            sketchybar -m --set headphones icon.drawing=on \
                                           icon=$HEADSET \
                                           icon.font.size=14.0
            sketchybar -m --set headset_name label.drawing=on label="$(echo "$DEVICES" | tr -d '"')"
        fi
    fi

}

popup () {
    CURRENT_ICON="$(sketchybar --query headphones | jq '.["icon"].["value"]' | tr -d '"')"
    if [[ $CURRENT_ICON == $HEADSET ]]; then
        sketchybar -m --set headphones popup.drawing=$1
    else
        sketchybar -m --set headphones popup.drawing=off
    fi
}

case "$SENDER" in
    "mouse.entered") popup on
    ;;
    "mouse.exited"|"mouse.exited.global") popup off
    ;;
    *) update
    ;;
esac
