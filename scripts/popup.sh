#!/usr/bin/env bash

TITLE=mylauncher

SCREEN_WIDTH=`yabai -m query --displays --display 1 | jq .frame.w*2`
SCREEN_HEIGHT=`yabai -m query --displays --display 1 | jq .frame.h*2`

TERM_WIDTH=1440
TERM_HEIGHT=900

let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"

alacritty -t "${TITLE}" -o "window.position={ x = $X, y = $Y }" -o window.dimensions.lines=10 -o window.dimensions.columns=60 -o font.size=20 --working-directory "$(pwd)" -e "$1"
