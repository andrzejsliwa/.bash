alias r='rebar'
alias rh='rebar -c'
alias erl='erl -config erl_hist.config -name term@127.0.0.1 -pa $PWD/ebin -pa $PWD/apps/*/ebin -pa $PWD/deps/*/ebin'

function erlang {
   source ~/erlangs/$1/activate
}

if [ -f ~/erlangs/kerl/bash_completion ]; then
    . ~/erlangs/kerl/bash_completion
fi

if [ -f ~/.rebar/templates/tools/rebar_rc ]; then
    source ~/.rebar/templates/tools/rebar_rc
fi

loaded "erlang"
