#!/usr/bin/env sh

sketchybar --add item     calendar right					\
           --set calendar update_freq=1						\
                          icon=cal							\
                          icon.color=$YELLOW				\
                          icon.font="$FONT:Semibold:13.0"   \
                          label.color=$YELLOW				\
                          icon.padding_right=5				\
                          label.padding_left=5				\
                          script="$PLUGIN_DIR/time.sh"
