#!/usr/bin/env sh

############## PRIMARY DISPLAY SPACES ############## 
SPACE_ICONS=("web" "code" "doc" "media" "misc" "6" "7" "8" "9" "10")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                       \
             --set space.$sid associated_space=$sid                 \
                              icon=${SPACE_ICONS[i]}                \
                              icon.color=$GREY                      \
                              icon.padding_right=10                 \
                              icon.background.drawing=off           \
                              icon.background.color=$CYAN           \
                              script="$PLUGIN_DIR/space.sh"         \
                              icon.background.height=2              \
                              icon.background.y_offset=-11          \
                              icon.background.padding_right=2       \
                              icon.background.padding_left=2        \
                              icon.padding_left=6                   \
                              icon.padding_right=6                  \
                              icon.highlight_color=$CYAN            \
                              label.drawing=off                     \
                              click_script="$SPACE_CLICK_SCRIPT"
done
