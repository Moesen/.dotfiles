# Xcliping to clipboard
alias xc='xclip -selection clipboard'
alias xo="xclip -selection clipboard -o"

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias t="tmux"
alias tk="kill_tmux_server"

# util
alias to="touch"
alias sv="source_venv"
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
alias k="kubectl"
alias ks="k9s"
alias kg="kubectl get"
alias kgn="kubectl get -n"
alias kga="kubectl get -n ameya"
alias kd="kubectl describe"
alias kdn="kubectl describe -n"
alias kpf="kubectl port-forward"
alias kcu="kubectl config use-context"
alias wp="watch kubectl get pods -n"
alias cur_cluster="kubectl config current-context"
## helm
alias gti="cd ~/alvenir/ameya/infrastructure"
alias gtd="cd ~/alvenir/ameya-demo/"
alias gta="cd ~/alvenir/ameya/"
alias hs="helmfile sync"
alias hd="helmfile destroy"
alias ht="helmfile template"
alias hb="helmfile build"
alias fl="kubectl logs -f -n"

# Make -C
alias mc="make -C"

# ls -> exa
alias ls="exa --icons"
alias lg="exa --icons --git-ignore"
alias ll="exa -alh --git --icons"
alias tree="exa --tree --git-ignore"

# cd -> zoxide
alias cd="z"
alias cdm="z -"

# cat -> bat
alias cat="bat"

# git
alias gs='nvim -c "Git | only"'
alias gc="git checkout"
alias gcm="git checkout -"
alias gcp="git cherry-pick"

# soren
alias whatisfood="wget -qO- https://meyers.dk/erhverv/frokostordning/ugens-menuer/ | grep "Dagens Varme ret" -A 3 | head -n 4 | sed 's/<[^>]*>//g' | perl -MHTML::Entities -Mopen=':std,:encoding(UTF-8)' -pe 'decode_entities($_);'"

# docker
alias start_docker_service="systemctl start docker.service docker.socket"
alias stop_docker_service="systemctl stop docker.service docker.socket"

alias get_external_ip='kubectl get svc -n ameya -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"'

# media alias
alias pp="paplay"
alias fp="ffplay -nodisp -stats"
# goto sctrach
alias gt="cd ~/alvenir/"
alias gts="cd ~/alvenir/scratch/"

# python alias
alias pir="pip install -r"
alias ur="uv run"
