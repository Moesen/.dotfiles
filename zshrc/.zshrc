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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/$USER/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/snoooze/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/$USER/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/snoooze/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

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
alias docker="sudo docker"

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
alias sv="source venv/bin/activate"
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
