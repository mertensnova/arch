
# Path to your oh-my-zsh installation.


export PATH="/usr/local/bin:/usr/bin"

export ZSH="$HOME/.local/share/zinit/plugins/ohmyzsh---ohmyzsh"
autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

ZSH_THEME="robbyrussell"

zinit light ohmyzsh/ohmyzsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

plugins=(git)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias vim="nvim"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
