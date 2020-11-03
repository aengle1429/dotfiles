# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unsetopt BEEP  # turn off this awful noise
setopt rm_star_silent
bindkey -v
alias vim='nvim'
alias vi='nvim'
export EDITOR=nvim
export VISUAL=nvim
ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting)
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
# set -o vi  # for bash, bindkey -v must precede history-incremental-search-backward
# if not using fzf, rely on
# bindkey "-R" history-incremental-pattern-search-backward  # or history-incremental-search-backward, OR "^R"
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -d $HOME/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
else
  source $HOME/powerlevel10k/powerlevel10k.zsh-theme
fi

if [[ ! -d $HOME/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
else
  source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ ! -d $HOME/.zsh/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
else
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# get raw and wget it to a hidden file
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
# setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }
# precmd () { __git_ps1 "\u@\h:\w" "\\\$ " }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
