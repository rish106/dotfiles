#!/usr/bin/env sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext -l 10 -nopgbrk -q -- "$1" -;;
    *) bat --plain --paging=never --theme=DarkNeon --color=always "$1";;
esac
