#!/usr/bin/env bash

UPDOWN=$(ifstat -i "en0" -b 0.1 1 | tail -n1)
DOWN=$(echo $UPDOWN | awk "{ print \$1 }" | cut -f1 -d ".")
UP=$(echo $UPDOWN | awk "{ print \$2 }" | cut -f1 -d ".")
DOWN_SPEED=$((DOWN/8))
UP_SPEED=$((UP/8))

SPEED=""
if [ "$UP_SPEED" -gt "$DOWN_SPEED" ]; then
  sketchybar -m --set network icon=
  if [ "$UP_SPEED" -gt "999" ]; then
    SPEED=$(echo $UP_SPEED | awk '{ printf "%.1f MB/s", $1 / 1000}')
  else
    SPEED=$(echo $UP_SPEED | awk '{ printf "%.1f KB/s", $1}')
  fi
else
  sketchybar -m --set network icon=
  if [ "$DOWN_SPEED" -gt "999" ]; then
    SPEED=$(echo $DOWN_SPEED | awk '{ printf "%.1f MB/s", $1 / 1000}')
  else
    SPEED=$(echo $DOWN_SPEED | awk '{ printf "%.1f KB/s", $1}')
  fi
fi
sketchybar -m --set network label="$SPEED"

