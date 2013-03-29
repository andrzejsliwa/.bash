source /usr/local/etc/bash_completion

alias dns='ec /etc/hosts; dscacheutil -flushcache'
alias lol='gem install lolcommits ; lolcommits --enable ; echo "false" | lolcommits --config --plugin loltext'
alias loll='lolcommits -l'
alias d="curl http://192.168.2.151:4000/open_door"
alias c="clear"
alias t="tmuxinator"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export ACKRC=".ackrc"

loaded "general"
