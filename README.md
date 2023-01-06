# My Dotfiles

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/36294070/210497145-f34d3519-e06b-4cc1-86c0-9333b8f24b8b.png">

| OS                | macOS Ventura     |
| :--------------:  | :---------------: |
| CPU               | Apple M1 |
| WM                | [yabai](https://github.com/koekeishiya/yabai) |
| Bar               | [sketchybar](https://github.com/FelixKratz/SketchyBar) |
| Package Manager   | [brew](https://github.com/Homebrew/brew) |
| Editor            | [neovim](https://github.com/neovim/neovim) using [NvChad](https://github.com/NvChad/NvChad) config |
| Terminal          | [Alacritty](https://github.com/alacritty/alacritty) |
| Terminal Font     | [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono) |
| App Launcher      | [Custom script](https://github.com/rish106/dotfiles#app-launcher) |
| File Manager      | [lf](https://github.com/gokcehan/lf) |
| Browser           | Firefox (with [cascade](https://github.com/andreasgrafen/cascade)) |


<img width="1440" alt="image" src="https://user-images.githubusercontent.com/36294070/210528500-cc403579-c9c7-4abc-8291-5c3883479318.png">

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/36294070/210532918-0ef03091-6334-42c8-8fbc-07814623d0e9.png">

## neovim setup
I use NvChad with the radium theme. To use my config,
- Download NvChad using
```zsh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```
- Paste the files in my nvim/lua/custom folder in your .config/nvim/lua/custom
- Run PackerSync
```zsh
nvim +PackerSync
```

## App Launcher
<img width="867" alt="image" src="https://user-images.githubusercontent.com/36294070/210528079-717fcae8-f288-4dbf-93de-4fb79f5ad755.png">

Spawns an instance of terminal and runs the fuzzy finder on app directories using the popup and launcher scripts present in [scripts](https://github.com/rish106/dotfiles/blob/master/scripts)
