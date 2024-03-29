alias clearswp="find . -name ".*.swp" | xargs rm -f"

alias a='arc'
alias g="git"
alias m="hg"
alias v="vim"
alias vt="vim -t"
alias x="exit"

alias rml="rm .git/index.lock"

export EDITOR="vim"

# Combines 'cd' and 'ls' into a single command
function cds() {
  cd "$1";
  ls;
}

# Print all contents of files by filetype, recursive.
function echoall() {
  for ext in "$@"; do
    find . -name "*.$ext" -exec echo '// {}' \; -exec cat {} \; -exec echo '' \;
  done
}

alias -- -='cd - && ls'
alias ..="cd .. && ls"
alias ...="cd ../.. && ls"
alias ....="cd ../../.. && ls"

alias ll="ls -l"

# git reset
function gr() {
  for i in $(eval echo {1..$1})
  do
    git reset --hard HEAD^
  done
}

function git_mode() {
  alias rd='git add . && git commit -a --amend --no-edit && arc diff --only'
  alias rdd='git add . && git commit -a --amend --no-edit && arc diff'
  alias new="git add . && git commit -am 'temp' && arc diff --only"
  alias neww="git add . && git commit -am 'temp' && arc diff"

  alias jk='git checkout HEAD^'
  alias gpl='git pull --rebase'

  alias gl="git log"
  alias gs="git status"
  alias gb="git branch"
  alias gd="git diff"
  alias gls="git log --pretty=format:'%Cred%h%Creset - %Cgreen(%cr) %C(bold blue)<%an>%C(yellow)%d%Creset %s %Creset'"
}

function hg_mode() {
  alias rb="hg pull && hg up master && cook && hh"
  alias new="hg addremove && hg commit -m 'temp' && jf preview"
  alias rd="hg addremove && hg amend --rebase && jf preview"
  alias rdd="hg addremove && hg amend --rebase && jf submit"
  alias jk="hg revert -r .^"

  alias ms="hg status"
  alias md="hg diff"
  alias ml="hg sl"
  alias mm="hg metaedit"
  alias msl="hg smartlog"
  alias mut="hg up tip"

  alias fillin="jf template && hg commit --amend"

  function take() {
    hg graft -r "$1" && hg strip -r "$1";
  }
}

git_mode

# Provides an alias to get minimize terminal prompt
function tmin() {
  export PS1_STORED=$PS1;
  export PS1='> ';
}
function tmax() {
  export PS1=`echo "$PS1_STORED"`;
}

# Replace all text in a directory from $1 to $2
function replace_all() {
  find . -type f -print0 | xargs -0 sed -i '' -e 's/'$1'/'$2'/g';
}

alias cls="clear && tmux clear-history";
alias c="clear && tmux clear-history";

# Make other aliases work with sudo
alias sudo='sudo '

# Make git always show stuff in local timezone
git config --global log.date local

# Git auto-complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Date format in bash history file.
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
export HISTIGNORE="ls:ps:history"
shopt -s cmdhist

# source ~/.bashrc and ~/.bash_profile_local if they exist
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# reminder to self:
# alias dev="mosh -6 <server> -- tmux attach -t 0 -d"

if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

set -o vi

# Include hidden files with cp, mv, etc.
shopt -s dotglob nullglob

python3 ~/day_of_week.py


