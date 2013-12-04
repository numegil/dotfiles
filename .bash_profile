alias clearswp="find . -name ".*.swp" | xargs rm -f"

export EDITOR="vim"

# Combines 'cd' and 'ls' into a single command
function cds() {
  cd $1;
  ls;
}

# Replace all text in a directory from $1 to $2
function replaceall() {
  find . -type f -print0 | xargs -0 sed -i 's/'$1'/'$2'/g';
}

# Provides an alias to get minimize terminal prompt
function terminal_min() {
  export PS1_STORED=$PS1;
  export PS1='> ';
}
function terminal_max() {
  export PS1=`echo "$PS1_STORED"`;
}

alias cls="clear && tmux clear-history";

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
