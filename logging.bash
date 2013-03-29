exec 3>&2    # logging stream (file descriptor 3) defaults to STDERR

lvl_silent=0
lvl_error=1
lvl_warning=2
lvl_debug=3
lvl_info=4

verbosity=$lvl_warning

logging() {
  if [ $verbosity -ge $1 ]; then
    echo -e "$2" >&3
  fi
}

notify()  { logging $lvl_silent  "NOTE: $1";    }
error()   { logging $lvl_error   "ERROR: $1";   }
warning() { logging $lvl_warning "WARNING: $1"; }
debug()   { logging $lvl_debug   "DEBUG: $1";   }
info()    { logging $lvl_info    "INFO: $1";    }

loaded() {
  info "loaded $1"
}
