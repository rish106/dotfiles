#!/usr/bin/env bash

current=$(mpc)
if [[ -z $current ]]; then
    sketchybar -m --set mpd icon.drawing=off	\
                  --set mpd label.drawing=off
else
    [[ $current == *"[playing]"* ]] && icon="" || icon=""
    artist=$(mpc current -f %artist%)
    song=$(mpc current -f %title%)
    output="${artist} • ${song}"
    sketchybar -m --set mpd icon.drawing=on 	\
                  --set mpd label.drawing=on    \
                  --set mpd icon="${icon}"		\
                  --set mpd label="${output}"
fi

