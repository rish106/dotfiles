#!/usr/bin/env sh

FILE="$1"
PV_WIDTH="$2"
PV_HEIGHT="$3"
HORIZONTAL_POS="${4}"
VERTICAL_POS="${5}"

image_preview() {
    kitty +kitten icat --transfer-mode file --stdin no --place "${PV_WIDTH}x${PV_HEIGHT}@${HORIZONTAL_POS}x${VERTICAL_POS}" "$FILE" < /dev/null > /dev/tty
    exit 1
}

video_preview() {
    mediainfo "$FILE"
    # timg -p kitty --center --fit-width -t15 "$FILE"
    # exit 1
}

MIME_TYPE="$(file --dereference --brief --mime-type "$FILE")"

case "$MIME_TYPE" in
    application/x-tar) tar tf "$FILE";;
    application/zip) unizp -l "$FILE";;
    application/x-rar) unrar l "$FILE";;
    application/x-7z-compressed) 7z l "$FILE";;
    image/*) image_preview;;
    video/*) video_preview;;
    audio/*) mediainfo "$FILE";;
    application/pdf) pdftotext -l 10 -nopgbrk -q -- "$FILE" -;;
    *) bat --plain "$FILE";;
esac
