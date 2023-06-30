#!/usr/bin/env sh

FILE="$1"
PV_WIDTH="$2"
PV_HEIGHT="$3"
HORIZONTAL_POS="${4}"
VERTICAL_POS="${5}"

image_preview() {
    # mediainfo "$FILE"
    kitty +kitten icat --transfer-mode file --stdin no --place "${PV_WIDTH}x${PV_HEIGHT}@${HORIZONTAL_POS}x${VERTICAL_POS}" "$FILE" < /dev/null > /dev/tty
    exit 1
}

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.png | *.jpg | *.jpeg | *.svg | *.gif | *.webp) image_preview;;
    *.mp4 | *.mkv | *.mov | *.m4v | *.avi | *.flc | *.webm | *.wmv | *.mp3 | *.flac | *.m4a | *.wav | *.opus | *.mpc | *.aac) mediainfo "$1";;
    *.pdf) pdftotext -l 10 -nopgbrk -q -- "$1" -;;
    *) bat --plain "$1";;
esac
