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
# set -o vi  # for bash
