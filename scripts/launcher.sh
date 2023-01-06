find /System/Library/CoreServices /System/Applications /Applications -maxdepth 2 -name "*.app" | fzf | xargs -I {} open -n "{}"
