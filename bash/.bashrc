#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export XDG_DATA_HOME=$HOME/.local/share
export HISTFILE="$XDG_DATA_HOME"/bash/history
