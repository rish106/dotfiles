export TERM="xterm-256color"
export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"

export C_INCLUDE_PATH="$HOMEBREW_PREFIX/lib/gcc/current/gcc/aarch64-apple-darwin23/13/include:\
    $HOMEBREW_PREFIX/lib/gcc/current/gcc/aarch64-apple-darwin23/13/include-fixed:\
    /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include"
export CPLUS_INCLUDE_PATH="$HOMEBREW_PREFIX/include/c++/13/aarch64-apple-darwin23:\
    $HOMEBREW_PREFIX/include/c++/13:$HOMEBREW_PREFIX/include"

take() {
    mkdir -p "$1"
    cd "$1"
}

export PATH="$PATH:$HOMEBREW_REPOSITORY/opt/postgresql@15/bin"

# VIM MODE
bindkey -v
bindkey "^?" backward-delete-char

# fzf
source "$HOME/.fzf.zsh"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#11111b,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# set gopath
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Use lf to switch directories
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# set history size
export HISTSIZE=10000
# save history after logout
export SAVEHIST=10000
# save only one command if 2 common are same and consistent
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

source "$HOME/.config/zsh/aliases.zsh"

# tmux session manager
export PATH="$PATH:$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin"

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
