# use exa instead of ls
alias ls="eza"

# git aliases
alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(green)%an %ar %C(reset) %C(bold magenta)%d%C(reset)'"
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || ls'

alias lg="lazygit"

alias c="clear"

# view pdf in terminal
alias tp="termpdf.py"

# brew
alias bstart="brew services start"
alias bstop="brew services stop"
alias brestart="brew services restart"

