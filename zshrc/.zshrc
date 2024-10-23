autoload bashcompinit && bashcompinit
autoload -U compinit; compinit

#############
#  STATICS  #
#############
user=$(whoami)

###########
#  LOADS  #
###########

# Starship used for custom prompt
eval "$(starship init zsh)"

# Setting python default path to pyenv
export PATH="/home/${user}/.pyenv/versions/3.11.9/bin:$PATH"


# zsh completions using zstyle and zshcompsys
source ~/.dotfiles/zshrc/completion.zsh

# Functions
source ~/.dotfiles/zshrc/funcs.zsh

# Aliases
source ~/.dotfiles/zshrc/alia.zsh

# azure-cli autocomplete
source ~/.dotfiles/zshrc/az.completion

# docker-cli autocomplete
source ~/.dotfiles/zshrc/docker-compose-completion.sh


# env options
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# hist stuff
HISTSIZE=10000
SAVEHIST=10000
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true # Import colorsceheme from 'wal' asyncronously
HISTFILE=${HOME}/.zsh_history
HISTORY_IGNORE="(l[alsh]#( *)#)"

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

export PATH="/home/${user}/.cargo/bin:$PATH"

# FuzzyFinder
export FZF_DEFAULT_OPTS='
    --color=bg:#282828,fg:#ebdbb2,hl:#928374
'
nvimfzf() {
    local file
    file=$(fzf --height 40% --layout=reverse)
    [[ -n $file ]] && nvim "$file"
}
alias f="nvimfzf"

# bun completions
[ -s "/home/${user}/.local/share/reflex/bun/_bun" ] && source "/home/${user}/.local/share/reflex/bun/_bun"

# AWS Cli completion
[ -s "/usr/local/bin/aws_completer" ] && [ -s "/usr/local/bin/aws" ] && complete -C /usr/local/bin/aws_completer aws



# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
eval "$(zoxide init zsh)"

# Don't show files in .gitignore with fzf
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/moesen/tmp/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/moesen/tmp/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/moesen/tmp/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/moesen/tmp/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
