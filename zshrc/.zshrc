#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Small options
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

# oh-my-zsh Plugins
plugins=(
	git kubectl history emoji encode64
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Package manager antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export EDITOR="nvim"

# Conda
__conda_setup="$('/home/snoooze/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/snoooze/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/snoooze/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/snoooze/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#Aliases
# The fun train
alias sl="sl -F -l -a" 

# Vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/snoooze/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/snoooze/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/snoooze/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/snoooze/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
