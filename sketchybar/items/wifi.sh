#!/usr/bin/env sh

sketchybar --add item wifi right	                    \
           --set wifi script="$PLUGIN_DIR/wifi.sh"      \
                     label.color=$GREEN                 \
                     label.padding_right=10             \
           --subscribe wifi wifi_change
