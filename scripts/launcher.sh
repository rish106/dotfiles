#!/usr/bin/env bash

pick=$(find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "*.app" | awk -F "/" '{print $NF}' | fzf --reverse)
find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "$pick" | xargs -I {} open -n "{}"
