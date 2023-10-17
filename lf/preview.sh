#!/usr/bin/env sh

FILE="$1"
PV_WIDTH="$2"
PV_HEIGHT="$3"
HORIZONTAL_POS="${4}"
VERTICAL_POS="${5}"

hash() {
    printf '%s/.cache/lf/%s.jpg' "$HOME" \
        "$(gstat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | md5 -q | awk '{print $1}')"
}

IMAGE_CACHE_PATH="$(hash "$FILE_PATH")" # Full path that should be used to cache image preview

image_preview() {
    kitty +kitten icat --transfer-mode file --stdin no --place \
        "${PV_WIDTH}x${PV_HEIGHT}@${HORIZONTAL_POS}x${VERTICAL_POS}" "$1" < /dev/null > /dev/tty
    exit 1
}

video_preview() {
    ffmpegthumbnailer -m -i "${FILE}" -o "${IMAGE_CACHE_PATH}" -s 0
    image_preview "$IMAGE_CACHE_PATH"
    exit 1
}

pdf_preview() {
    DEFAULT_SIZE="1024x768"
    pdftoppm -f 1 -l 1 \
        -scale-to-x "${DEFAULT_SIZE%x*}" \
        -scale-to-y -1 \
        -singlefile \
        -jpeg -tiffcompression jpeg \
        -- "$FILE" "${IMAGE_CACHE_PATH%.*}"
    image_preview "$IMAGE_CACHE_PATH"
    exit 1
}

MIME_TYPE="$(file --dereference --brief --mime-type "$FILE")"

case "$MIME_TYPE" in
    application/x-tar) tar tf "$FILE";;
    application/zip) unzip -l "$FILE";;
    application/x-rar) unrar l "$FILE";;
    application/x-7z-compressed) 7z l "$FILE";;
    image/*) image_preview "$FILE";;
    video/*) video_preview;;
    audio/*) mediainfo "$FILE";;
    application/pdf) pdf_preview;;
    *) bat --plain "$FILE";;
esac
