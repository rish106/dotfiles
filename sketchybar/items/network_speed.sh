#!/usr/bin/env sh

sketchybar  --add item      network right                               \
            --set network   label.font="$FONT:Semibold:12.0"            \
                            label.padding_right=4                       \
                            label.color=$MAGENTA                        \
                            icon.color=$MAGENTA                         \
                            icon.font="SFMono Nerd Font:Medium:18.0"    \
                            label.padding_right=4                       \
                            update_freq=1                               \
                            script="$PLUGIN_DIR/network_speed.sh"
