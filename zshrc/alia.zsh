# Xcliping to clipboard
alias xc='xclip -selection clipboard'
alias xo="xclip -selection clipboard -o"

# Vim
alias v="nvim"
alias vi="nvim"

# Rust replacements
alias find=fd
alias du=dust
alias cat="bat"

# util
alias sv="source_venv"
alias da="deactivate"
alias sz="source ~/.dotfiles/zshrc/.zshrc"
alias z="\\zellij"

# Dots
alias dot="gotodot"

## k8s
alias k="kubectl"
# ls -> exa
alias ls="exa --icons"
alias lg="exa --icons --git-ignore"
alias ll="exa -alh --git --icons"
alias tree="exa --tree --git-ignore"

# cd -> zoxide
alias cd="\\z"
alias cdm="\\z -"


# git
alias gs='nvim -c "Git | only"'
alias gc="git checkout"
alias gcm="git checkout -"
alias gcp="git cherry-pick"
