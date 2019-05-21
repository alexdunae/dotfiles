export PATH="/usr/local/bin/psql:/usr/local/heroku/bin:$HOME/.fastlane/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export EDITOR="/usr/local/bin/subl -w"
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export CC=/usr/bin/gcc

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/Library/Python/3.4/bin:~/Library/Python/2.7/bin

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

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

export PS1='\w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if which thefuck > /dev/null; then eval "$(thefuck --alias)"; fi


alias ls='ls -alhG'
alias gco='git checkout'
__git_complete gco _git_checkout
alias gd='git diff'
alias gl='git l'
alias gp='git push'
__git_complete gp _git_push
alias gbr='git branch'
__git_complete gbr _git_branch
alias gs='git status'
alias gpr='git pull --rebase'
alias rc='rails console'
alias be='bundle exec'
alias brake='bundle exec rake'
alias sbrake='sudo bundle exec rake'
alias bems='bundle exec middleman server'
alias bemd='bundle exec middleman deploy'
alias beg='bundle exec guard'
alias tlog='tail -n250 -f log/test.log'
alias dlog='tail -n250 -f log/development.log'
alias cat=ccat

# thanks thoughtbot
alias path='echo $PATH | tr -s ":" "\n"'
alias t="ruby -I test"

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
    $sublime_path .
    exit 0
  fi

  $sublime_path --project $sublime_project
}

if command -v lsd >/dev/null 2>&1; then
  alias ls='lsd -l'
  alias la='lsd -alh'
  alias lt='lsd -rt' # most recently modified last
fi

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
    bin/foreman start --port=3000 $@
  elif [ -a Procfile.dev ]; then
    bundle exec foreman start -f Procfile.dev $@
  elif [ -a Procfile ]; then
    bundle exec foreman start --port=3000 $@
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
export PATH="/usr/local/opt/node@8/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi
