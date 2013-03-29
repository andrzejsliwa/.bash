function custom() {
  if [ "$#" == 1 ]; then
    $EDITOR ~/.bash/customs/$1.bash
    if [ -f ~/.bash/customs/$1.bash ]; then
      grep "$1.bash" ~/.bash/includes.bash >/dev/null || echo "source ~/.bash/customs/$1.bash" >> ~/.bash/includes.bash
      verbosity=$lvl_info
      source ~/.bash/includes.bash
    fi
  else
    echo "available customs:"
    for file in ~/.bash/customs/*
    do
      file=${file%.*}
      file=${file##*/}
      echo "  $file"
    done

    echo ""
    echo "example usage:"
    echo "  $ custom name_of_custom"
  fi
}

loaded "custom"
