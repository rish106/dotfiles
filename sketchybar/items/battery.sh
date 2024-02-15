sketchybar  --add       item        battery     right                       \
            --set       battery     script="$PLUGIN_DIR/battery.sh"         \
                                    update_freq=30                          \
                                    label.font="$FONT:Light:20.0"           \
                                    icon.font="$FONT:Semibold:12.0"         \
                                    label.color=$WHITE                      \
                                    icon.color=$WHITE                       \
                                    label.padding_right=8                   \
            --subscribe battery     system_woke                             \
                                    power_source_change
