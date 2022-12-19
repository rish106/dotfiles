sketchybar -m --add       item              headphones  right                                       \
              --set       headphones        icon=􀑈                                                  \
                                            label.drawing=off                                       \
                                            icon.padding_right=4                                    \
                                            icon.padding_left=0                                     \
                                            script="$PLUGIN_DIR/ble_headset.sh"                     \
                                            popup.horizontal=on                                     \
                                            popup.align=center                                      \
                                            popup.height=28                                         \
                                            popup.y_offset=4                                        \
                                            update_freq=3                                           \
              --subscribe headphones        mouse.entered mouse.exited                              \
                                            mouse.exited.global                                     \
                                                                                                    \
              --add       item              headset_name popup.headphones                           \
              --set       headset_name      script="$PLUGIN_DIR/ble_headset.sh"                     \
                                            label.color=$CYAN                                       \
                                            label.padding_right=12                                  \
                                            label.padding_left=12                                   \
                                            label.drawing=off                                       \
                                            icon.drawing=off
