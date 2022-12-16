sketchybar -m --add       event             bluetooth_change "com.apple.bluetooth.status"           \
              --add       item              headphones  right                                       \
              --set       headphones        icon=􀑈                                                  \
                                            script="$PLUGIN_DIR/ble_headset.sh"                     \
                                            popup.horizontal=on                                     \
                                            popup.align=center                                      \
                                            popup.height=24                                         \
                                            popup.y_offset=4                                        \
                                            update_freq=3                                           \
              --subscribe headphones        bluetooth_change                                        \
                                            mouse.entered mouse.exited                              \
                                            mouse.exited.global                                     \
                                                                                                    \
              --add       item              headset_name popup.headphones                           \
              --set       headset_name      script="$PLUGIN_DIR/ble_headset.sh"                     \
                                            label.color=$CYAN                                       \
                                            label.align=center                                      \
                                            label.drawing=off                                       \
                                            icon.drawing=off
