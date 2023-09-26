autoload -U compinit; compinit

# env options
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true # Import colorsceheme from 'wal' asyncronously
# (cat ~/.cache/wal/sequences &)

# Starship used for custom prompt
eval "$(starship init zsh)"

# zsh completions using zstyle and zshcompsys
source ~/.dotfiles/zshrc/completion.zsh

# Package manager antidote
# Git clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote
# source antidote
. ~/.antidote/antidote.zsh
# generate and source plugins from ~/.zsh_plugins.txt
antidote load

# history-substring-search-keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ZSH_AUTOSUGGEST_STRATEGY=(completion history)
bindkey '^[\t' autosuggest-accept

export EDITOR="nvim"

# Ranger command to use config file instead
RANGER_LOAD_DEFAULT_RC="false"

# Conda
# __conda_setup="$('/home/$USER/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/$USER/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/$USER/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# conda activate


#######################################################
#     __ ___  _____  __  ___    ___ ___ ____ __   __   #
#    /_\ | |  |_ _| /_\ / __|  / __|_ _|_   _\ \ / /  #
#   / _ \| |__ | | / _ \\__ \ | (__ | |  | |  \ V /   #
#  /_/ \_\____|___/_/ \_\___/  \___|___| |_|   |_|    #
#                                                     #
#######################################################

alias ls="ls --color=auto"

# Xcliping to clipboard
alias xc='xclip -selection clipboard'

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias t="tmux"

# Hygge
alias bis="echo 'jeg elsker bis'"

# Firefox
alias f="firefox"
alias fn="firefox -n"

# Typing test
alias tt="/opt/typioca/execs/typioca"

# Tmux configs
alias tmu3="~/.dotfiles/tmux/tmux_layout_scripts/tmux3panestartup.sh"
alias hpc="ssh s174169@login1.gbar.dtu.dk"
alias hpctmux="~/.dotfiles/tmux/tmux_layout_scripts/tm_DLCV_temp.sh"

# Image alias
alias imgt="source ~/.dotfiles/zshrc/image_tools.sh"

# Kali
alias kali="sudo docker start e62d62a79d89 && sudo docker attach e62d62a79d89"

# Docker
# alias docker="sudo docker"

# See log from xsession
alias clog="tail ~/.local/share/sddm/xorg-session.log"

# Source .zshrc
alias sz="source ~/.dotfiles/zshrc/.zshrc"

# Alias for ls -a
alias lsa="ls -a"

# dotfiles dir
alias dot="~/.dotfiles"

# source venv, when in folder for with venv in it
# deactivate also here
alias sv="source ./venv/bin/activate"
alias da="deactivate"

alias cb="~/.dotfiles/zshrc/.cbuild.sh"

#### Functions #####
gcom() {
    if [ $# -ne 1 ]
    then
        echo "Usage: $funcstack[1] <commit-message>"
        return
    fi

    echo "git commit -m '$1'"
    git commit -m $1
}
 
fnd() {
    find . -wholename "$1"
}

alias to="touch"

push_dot_changes() {
    if [ $# -ne 1 ]
    then
        echo "Usage $funcstac[1] <commit-message>" 
        return
    fi

    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles add .
    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles commit -m $1
    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles push
}

push_notes() {
    tmp=$(pwd)
    cd ~/Vaults/vault-alvenir
    git add .
    git commit -m "auto: add notes for the day"
    git push
    cd $tmp
    unset tmp
}

# Activate Azure Python Venv
alias activate-az="source ~/azure-cli-env/bin/activate"
alias azz="source ~/azure-cli-env/bin/activate"
# Activate Alvenir Python Venv
alias activate-alvenir="source ~/alvenir/ameya/alvenir_venv/bin/activate"
alias al="source ~/alvenir/ameya/alvenir_venv/bin/activate"

# Shortcut for kubectl port forward
alias kpf="kubectl port-forward"

# Copy cur path and save to clipboard
alias pwdxc="pwd | xc"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/snooze/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/snooze/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/snooze/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/snooze/tmp/google-cloud-sdk/completion.zsh.inc'; fi

sc() {
    cur=$(pwd)
}
gb() {
    cd $cur
}

function make_deploy_all() {
    make -C ~/alvenir/ameya/infrastructure deploy-all
}

function make_destroy_all() {
    make -C ~/alvenir/ameya/infrastructure destroy-all
}

function podlog {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly podname=${2:?"Podname must be specified"}
    kubectl logs -n $namespace $podname
}

function grep_podlog {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly grepname=${2:?"Must specify grep filter see podlog if grep not required"}
    readonly podname=${3:?"Podname must be specified"}
    kubectl logs -n $namespace $podname | grep $grepname
}

function grep_all_pod_logs {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly grepname=${2:?"Must specify grep filter see podlog if grep not required"}
    readonly podname=${3:?"Podname must be specified"}


    for pod in $(echo "$(kubectl get pods -n $namespace -o name | grep $podname)")
    do
        echo $pod
        echo "$(kubectl logs -n $namespace $pod | grep $grepname)"
    done
}

function watch_pods() {
    readonly namespace=${1:?"Namespace must be specified"}
    watch kubectl get pods -n $namespace
}

alias plog="podlog"
alias glog="grep_podlog"
alias mdp="make_deploy_all"
alias mds="make_destroy_all"
alias wpods="watch_pods"

docker_status() {
    docker ps --format 'table {{.ID}} \t {{.Names}} \t {{.Status}}'
}
