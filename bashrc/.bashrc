#
# ~/.bashrc
#
eval "$(starship init bash)"
eval "$(keychain --eval --quiet id_ed25519)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
