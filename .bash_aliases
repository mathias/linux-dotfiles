. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. ~/src/github.com/jdxcode/gh/bash/gh.bash
. ~/src/github.com/jdxcode/gh/completions/gh.bash

# Ruby
alias be="bundle exec"

# Git
alias gap="git add -p"
alias gst="git status"

# Heroku
alias h=heroku

# Emacs
e() {
  SERVICE='Emacs'

  if [[ -z $(ps ax | grep -v grep | grep $SERVICE) ]]
  then
    /usr/local/bin/emacs --daemon
  fi

  /usr/local/bin/emacsclient -c -n $1
}

# Bash
alias hist="history | ag"
alias psag="ps aux | ag"