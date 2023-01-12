find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "*.app" | fzf --reverse | xargs -I {} open -n "{}"
