autoload -U compinit; compinit

###########
#  LOADS  #
###########

# Starship used for custom prompt
eval "$(starship init zsh)"

# zsh completions using zstyle and zshcompsys
source ~/.dotfiles/zshrc/completion.zsh

# Functions
source ~/.dotfiles/zshrc/funcs.zsh

# Aliases
source ~/.dotfiles/zshrc/alia.zsh

# env options
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true # Import colorsceheme from 'wal' asyncronously
# (cat ~/.cache/wal/sequences &)
HISTSIZE=10000
SAVEHIST=10000

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

export PATH="/home/snooze/.cargo/bin:$PATH"

# FuzzyFinder
export FZF_DEFAULT_OPTS='
    --color=bg:#282828,fg:#ebdbb2,hl:#98971a
'
nvimfzf() {
    local file
    file=$(fzf --height 40% --layout=reverse)
    [[ -n $file ]] && nvim "$file"
}
alias f="nvimfzf"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/snooze/pkg/google-cloud-sdk/path.zsh.inc' ]; then . '/home/snooze/pkg/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/snooze/pkg/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/snooze/pkg/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/home/snooze/.local/share/reflex/bun/_bun" ] && source "/home/snooze/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

