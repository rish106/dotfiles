#!/usr/bin/env sh

update() {
    source "$HOME/.config/sketchybar/colors.sh"
    source "$HOME/.config/sketchybar/icons.sh"

    WINDOW=$(yabai -m query --windows --window)
    CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

    args=()
    if [[ $CURRENT -gt 0 ]]; then
        LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
        args+=(--set $NAME icon=$YABAI_STACK icon.color=$STACKED_WINDOW_COLOR label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
        borders active_color=$STACKED_WINDOW_COLOR

    else 
        args+=(--set $NAME label.drawing=off)
        case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
            "false")
                if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
                    args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$FULLSCREEN_WINDOW_COLOR)
                    borders active_color=$FULLSCREEN_WINDOW_COLOR
                elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
                    args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$PARENT_ZOOM_WINDOW_COLOR)
                    borders active_color=$PARENT_ZOOM_WINDOW_COLOR
                else
                    args+=(--set $NAME icon=$YABAI_GRID icon.color=$ACTIVE_WINDOW_COLOR)
                    borders active_color=$ACTIVE_WINDOW_COLOR
                fi
                ;;
            "true")
                args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$FLOATING_WINDOW_COLOR)
                borders active_color=$FLOATING_WINDOW_COLOR
                ;;
        esac
    fi

    sketchybar -m "${args[@]}"
}

mouse_clicked() {
    yabai -m window --toggle float
    update
}

case "$SENDER" in
    "mouse.clicked") mouse_clicked
    ;;
    "forced") exit 0
    ;;
    *) update 
    ;;
esac
