source /Users/andrzejsliwa/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias b="bundle"
alias be="bundle ex"
alias bu="bundle update"
alias rs="rails s"
alias rc="rails c"
alias r="rake"
alias rdbc="rake db:create:all db:seed"
alias rdbs="rake db:seed"
alias rdb="rake db:migrate db:test:prepare"
alias sp="rspec"
alias cu="cucumber"
alias t="tail -f log/development.log"

loaded "rails"
