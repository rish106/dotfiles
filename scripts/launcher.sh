#!/usr/bin/env bash

directories=("/System/Library/CoreServices" "/System/Applications" "/Applications")
pick=$(find ${directories[*]} -maxdepth 2 -name "*.app" | awk -F "/" '{print $NF}' | sed -e 's/\.app$//' | fzf --reverse --color=bg+:#313244,bg:#11111b,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8)
pick="${pick}.app"
find ${directories[*]} -maxdepth 2 -name "$pick" | xargs -I {} open -n "{}"
