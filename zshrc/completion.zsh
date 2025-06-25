# Guide:
# https://thevaluable.dev/zsh-completion-guide-examples/

# Show hidden files in autosuggest
# compinit
_comp_options+=(globdots)

# Loading to make colors work, which they still don't
zmodload  zsh/complist

# Order of trying to complete
zstyle ":completion:*" completer _extensions _complete _approximate

# Creates highlight around selection
zstyle ":completion:*" menu select

# Writes description of each category
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

# Not sure what this does
zstyle ':completion:*' group-name ''

# This should also add colors, but right now doesn't
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Sets completion to first try case sensitive, then insensitive, and also looks for partial completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v
export KEYTIMEOUT=1

# Keybinds for traversing completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Load autocompletion for helmfile
if ! type "$helmfile" > /dev/null; then;
    source <(helmfile completion zsh)
fi

if ! type "$helm" > /dev/null; then;
    source <(helm completion zsh)
fi

if ! type "$kubectl" > /dev/null; then;
    source <(kubectl completion zsh)
fi

if ! type "$minikube" > /dev/null; then;
    source <(minikube completion zsh)
fi

if ! type "$buf" > /dev/null; then;
    source <(buf completion zsh)
fi


if ! type "$pip" > /dev/null; then;
    source <(pip completion --zsh)
fi

if ! type "$just" > /dev/null; then;
  source <(just --completions=zsh)
fi

if ! type "$rustup" > /dev/null; then
  source <(rustup completions zsh)
fi
