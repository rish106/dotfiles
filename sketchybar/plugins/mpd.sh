#!/usr/bin/env bash

current=$(mpc)
artist=$(mpc current -f %artist%)
song=$(mpc current -f %title%)
mpderror=$(echo "$current" | awk '{print $2}')
if [[ -z $artist ]]; then
    sketchybar -m --set mpd icon.drawing=off	\
                  --set mpd label.drawing=off
else
    [[ $current == *"[playing]"* ]] && icon="" || icon=""
    output="${artist} • ${song}"
    sketchybar -m --set mpd icon.drawing=on 	\
                  --set mpd label.drawing=on    \
                  --set mpd icon="${icon}"		\
                  --set mpd label="${output}"
fi

