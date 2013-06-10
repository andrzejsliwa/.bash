alias r='rebar'
alias rh='rebar -c'
alias er='erl -config ~/erl_hist.config -name term@127.0.0.1 -pa $PWD/ebin -pa $PWD/apps/*/ebin -pa $PWD/deps/*/ebin'


function erlang {
   source ~/erlang/otp/$1/activate
}

if [ -f ~/erlangs/kerl/bash_completion ]; then
    . ~/erlangs/kerl/bash_completion
fi

if [ -f ~/.rebar/templates/tools/rebar_rc ]; then
    source ~/.rebar/templates/tools/rebar_rc
fi

function eapp {
  erl -noshell -eval "
    Path = code:lib_dir(list_to_atom(\"lists\")),
    io:format(\"~s\", [\"vim \" ++ Path]).
  " -s erlang halt
}

loaded "erlang"


