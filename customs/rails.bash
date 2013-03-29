source /Users/andrzejsliwa/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias b="bundle"
alias bu="bundle update"
alias rs="rails s"
alias rc="rails c"
alias r="rake"
alias rdbc="rake db:create:all"
alias rdbs="rake db:seed"
alias rdb="rake db:migrate"
alias sp="rspec"
alias cu="cucumber"
alias t="tail -f log/development.log"

loaded "rails"
