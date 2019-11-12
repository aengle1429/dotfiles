set -o vi
bindkey '^R' history-incremental-search-backward
zle -N edit-command-line
bindkey -M vicmd v edit-command-line