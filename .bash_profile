alias clearswp="find . -name ".*.swp" | xargs rm -f"

alias a='arc'
alias g="git"
alias m="hg"
alias v="vim"
alias vt="vim -t"
alias x="exit"

alias rd='git add . && git commit -a --amend --no-edit && arc diff --only'
alias rdd='git add . && git commit -a --amend --no-edit && arc diff'
alias new="git add . && git commit -am 'temp' && arc diff --only"

alias jk='git checkout HEAD^'

export EDITOR="vim"

# Combines 'cd' and 'ls' into a single command
function cds() {
  cd $1;
  ls;
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git reset
function gr() {
  for i in $(eval echo {1..$1})
  do
    git reset --hard HEAD^
  done
}

alias gl="git log"
alias gs="git status"
alias gb="git branch"

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

# Make other aliases work with sudo
alias sudo='sudo '

# Make git always show stuff in local timezone
git config --global log.date local

# Git auto-complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# source ~/.bashrc and ~/.bash_profile_local if they exist
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

set -o vi

python ~/day_of_week.py
