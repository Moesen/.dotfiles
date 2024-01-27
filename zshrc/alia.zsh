# Xcliping to clipboard
alias xc='xclip -selection clipboard'

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias t="tmux"

# See log from xsession
alias clog="tail ~/.local/share/sddm/xorg-session.log"

# Source .zshrc
alias sz="source ~/.dotfiles/zshrc/.zshrc"

# dotfiles dir
alias dot="cd ~/.dotfiles"
alias to="touch"
alias sv="source ./venv/bin/activate"
alias da="deactivate"
alias cb="~/.dotfiles/zshrc/.cbuild.sh"

# Activate Alvenir Python Venv
alias al="source ~/alvenir/envs/alvenir_venv/bin/activate"

# Shortcut for kubectl port forward
alias kpf="kubectl port-forward"

# Copy cur path and save to clipboard
alias pwdxc="pwd | xc"
alias plog="podlog"
alias glog="grep_podlog"
alias dp="make_deploy_all"
alias ds="make_destroy_all"
alias wpods="watch_pods"
alias k="kubectl"
alias clear_vim_swaps="rm ~/.local/state/nvim/swap/*"
alias ez="nvim ~/.zshrc"
alias i="cd ~/alvenir/ameya/infrastructure"
alias st="setup_tmux_cluster_test"
alias g="grafana"

alias oh="nvim ~/alvenir/ameya/infrastructure/helmfile.yaml"

# ls -> exa
alias ls="exa --icons"
alias ll="exa -alh --git"
alias tree="exa --tree"

# cat -> bat
alias cat="bat"

# git
alias gs="git status"
