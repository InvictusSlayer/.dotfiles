#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
#PS1='\e[0;35m[\u@\h \W]\$\e[m '
export PATH="$PATH:/home/$USER/eww/target/release/"
export PATH="$PATH:/home/$USER/.local/bin"

# For git
export GIT_EDITOR=nvim

fastfetch
