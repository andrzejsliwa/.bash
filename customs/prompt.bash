function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" != "" ] && version="$version"
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo -e "\033[0;31m*\033[0m"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function prompt_git() {
  local status local_branch_name local_branch local_flags remote_branch remote_branch_name
  status="$(git status 2>/dev/null)"
  [[ $? != 0 ]] && return;
  local_branch="$(echo "$status" | awk '/# Initial commit/ {print "(init)"}')"
  [[ "$local_branch" ]] || local_branch="$(echo "$status" | awk '/# On branch/ {print $4}')"
  [[ "$local_branch" ]] || local_branch="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
  local_branch_name=$local_branch
  local_flags="$(
    echo "$status" | awk 'BEGIN {r=""} \
      /^# Changes to be committed:$/        {r=r "+"}\
      /^# Changes not staged for commit:$/  {r=r "!"}\
      /^# Untracked files:$/                {r=r "?"}\
      END {print r}'
  )"
  if [[ "$local_flags" ]]; then
    local_branch="\033[0;31m$local_branch\033[0m"
  else
    local_branch="\033[0;32m$local_branch\033[0m"
  fi

  remote_branch_name="$(git for-each-ref --format='%(upstream:short)' refs/heads/${local_branch_name})"
  if [[ "$remote_branch_name" && ! "$local_branch_name" == "$remote_branch_name" ]]; then
    local local_sha remote_sha
    local_sha="$(git for-each-ref --format='%(objectname)' refs/heads/${local_branch_name})"
    remote_sha="$(git for-each-ref --format='%(objectname)' refs/remotes/${remote_branch_name})"
    if [[ "$local_sha" == "$remote_sha" ]]; then
      remote_branch="\033[0;32m$remote_branch_name\033[0m"
    else
      remote_branch="\033[0;31m$remote_branch_name\033[0m"
    fi
    echo -e "[$local_branch - $remote_branch]"
  else
    echo -e "[$local_branch] "
  fi
}
export PS1='\[\033[0;34m\]\u@\h $(rvm_version)\[\033[0m\] $(prompt_git)\n\[\033[0;34m\]\w\[\033[0m\] $ '

loaded "prompt"
