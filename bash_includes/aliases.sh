###########
# Aliases #
###########
alias ll="ls -lG"
alias la="ls -laG"

# navigation to parent directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

# create non-existing parent directories automatically
alias mkdir='mkdir -pv'

alias grep="grep --color"

alias pull="git pull --rebase"

# replace Mac OSX "BSD-style" sleep with GNU sleep (installed from homebrew)
alias sleep="gsleep"
