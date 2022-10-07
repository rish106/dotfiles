sketchybar -m --add item mpd center									\
              --set mpd update_freq=1								\
                        script="$PLUGIN_DIR/mpd.sh"					\
                        icon.font="SFMono Nerd Font:Regular:16.0"   \
                        label.color=$WHITE							\
                        icon.color=$WHITE							\
                        click_script="mpc toggle"
