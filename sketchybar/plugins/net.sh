#!/usr/bin/env sh
source $HOME/.config/sketchybar/colors.sh

airport=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
AIRPORT=$(echo "$airport" | awk 'NR==1 {print $2}')
LABEL=$(echo "$airport" | awk 'NR==13 {print $2 $3 $4 $5}')

if [ $AIRPORT = "Off" ]; then
    sketchybar -m --set net icon=􀙈 icon.color=$WHITE
elif [ -z $LABEL ]; then
    sketchybar -m --set net icon=􀙥 icon.color=$WHITE
else
    sketchybar -m --set net icon=􀙇 icon.color=$GREEN
fi

sketchybar -m --set net label=$LABEL

