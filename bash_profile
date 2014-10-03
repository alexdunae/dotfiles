export PATH="/usr/local/bin/psql:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export EDITOR="/usr/local/bin/subl -w"

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

alias ls='ls -alhG'
alias gco='git checkout'
alias gd='git diff'
alias gl='git l'
alias gp='git push'
alias gs='git status'
alias gpr='git pull --rebase'
alias rc='rails console'
alias be='bundle exec'
alias brake='bundle exec rake'
alias bems='bundle exec middleman server'
alias bems='bundle exec guard'


# https://github.com/garybernhardt/dotfiles/blob/master/.bashrc

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

export PS1='\w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# open Sublime Text using the first *.sublime-project in the current directory
# otherwise just use the current directory
subp() {
  sublime_project=$(find *.sublime-project 2>/dev/null | head -n 1)
  sublime_path=$(which subl)

  if [ ! -f "$sublime_path" ]; then
    echo "Could not find 'subl' command"
    exit 1
  fi

  if [ "$sublime_project" = "" ]; then
    sublime_project="."
  fi

  $sublime_path $sublime_project
}



# https://github.com/JEG2/dotfiles/blob/master/bash/aliases

# console
function rlc() {
  if [ -x bin/rails ]; then
    bin/rails console $@
  elif [ -x script/console ]; then
    script/console $@
  else
    bundle exec rails console $@
  fi
}

# server
function rls() {
  if [ -x bin/foreman ]; then
    bin/foreman start $@
  elif [ -a Procfile ]; then
    bundle exec foreman start $@
  elif [ -x bin/rails ]; then
    bin/rails server $@
  elif [ -x script/server ]; then
    script/server $@
  else
    bundle exec rails server $@
  fi
}

# generator
function rlg() {
  if [ -x bin/rails ]; then
    bin/rails generate $@
  elif [ -x script/generate ]; then
    script/generate $@
  else
    bundle exec rails generate $@
  fi
}

