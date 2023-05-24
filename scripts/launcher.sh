#!/usr/bin/env bash

pick=$(find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "*.app" | awk -F "/" '{print $NF}' | fzf --reverse --color=bg+:#313244,bg:#11111b,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8)
find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "$pick" | xargs -I {} open -n "{}"
