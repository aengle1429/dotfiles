ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting)
# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/

# https://stackoverflow.com/questions/30840651/what-does-autoload-do-in-zsh 
# records that `edit-command-line` is a function and not an external program
# man zshbuiltins
autoload -U edit-command-line
# Create  a  new  keymap named `edit-command-line`
# zsh line editor man zshzle
zle -N edit-command-line
# https://unix.stackexchange.com/questions/6620/how-to-edit-command-line-in-full-screen-editor-in-zsh
# vicmd  vi emulation - command mode
# -M vicmd... vicmd is the keymap name that is selected for any operations by the current command.
bindkey -M vicmd v edit-command-line
setopt rm_star_silent
# set -o vi  # for bash, bindkey -v must precede history-incremental-search-backward
# if not using fzf, rely on
# bindkey "-R" history-incremental-pattern-search-backward  # or history-incremental-search-backward
# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
