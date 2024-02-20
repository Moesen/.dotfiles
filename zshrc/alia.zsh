# Xcliping to clipboard
alias xc='xclip -selection clipboard'

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias t="tmux"

# util
alias to="touch"
alias sv="source ./venv/bin/activate"
alias da="deactivate"
alias sz="source ~/.dotfiles/zshrc/.zshrc"

# Dots
alias dot="cd ~/.dotfiles"
alias ez="nvim ~/.zshrc"
alias clear_vim_swaps="rm ~/.local/state/nvim/swap/*"

# Alvenir
alias al="source ~/alvenir/envs/alvenir_venv/bin/activate"
alias oh="nvim ~/alvenir/ameya/infrastructure/helmfile.yaml"
alias g="grafana"
alias st="setup_tmux_cluster_test"
## k8s
alias kpf="kubectl port-forward"
alias wp="watch kubectl get pods -n"
alias k="kubectl"
## helm
alias i="cd ~/alvenir/ameya/infrastructure"

# ls -> exa
alias ls="exa --icons"
alias ll="exa -alh --git"
alias tree="exa --tree"

# cat -> bat
alias cat="bat"

# git
alias gs="nvim -c Git"
