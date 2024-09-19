# Xcliping to clipboard
alias xc='xclip -selection clipboard'

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias t="tmux"
alias tk="kill_tmux_server"

# util
alias to="touch"
alias sv="source ./venv/bin/activate"
alias da="deactivate"
alias sz="source ~/.dotfiles/zshrc/.zshrc"

# Dots
alias dot="gotodot"
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
alias mk="minikube"
alias cur_cluster="kubectl config current-context"
## helm
alias i="cd ~/alvenir/ameya/infrastructure"
alias gd="cd ~/alvenir/ameya-demo/"
alias ga="cd ~/alvenir/ameya/"
alias hs="helmfile sync"
alias hd="helmfile destroy"
alias fl="kubectl logs -f -n"

# ls -> exa
alias ls="exa --icons"
alias ll="exa -alh --git"
alias tree="exa --tree"

# cd -> zoxide
alias cd="z"

# cat -> bat
alias cat="bat"

# git
alias gs="nvim -c Git"
alias gc="git checkout"
alias gcm="git checkout -"

# soren
alias whatisfood="wget -qO- https://meyers.dk/erhverv/frokostordning/ugens-menuer/ | grep "Dagens Varme ret" -A 3 | head -n 4 | sed 's/<[^>]*>//g' | perl -MHTML::Entities -Mopen=':std,:encoding(UTF-8)' -pe 'decode_entities($_);'"

# docker
alias start_docker_service="systemctl start docker.service docker.socket"
alias stop_docker_service="systemctl stop docker.service docker.socket"
