alias gc='git commit -u'
alias ga='git add -u'
alias gu='git pull'
alias gp='git push'
alias gb='git checkout -'
alias gcb='git checkout -b'
alias gm='git branch --merged'
alias gnm='git branch --no-merged'
alias gbl='git blame -w'
alias gs='git status -sb'
alias gk='touch .gitkeep'
alias git='hub'

function gcm {
   message=""
   for word in "$@"
   do
      message+="$word "
   done
   echo "git commit -u -m \"$message\""
   git commit -u -m "$message"
   git push
}

function git_scoreboard {
  git log | grep '^Author' | sort | uniq -ci | sort -r
}

loaded "git"
