alias clearswp="find . -name ".*.swp" | xargs rm -f"

export EDITOR="vim"

# Combines 'cd' and 'ls' into a single command
function cds(){
  cd $1;
  ls;
}

# Provides an alias to get minimize terminal prompt
function terminal_min() {
  export PS1_STORED=$PS1;
  export PS1='> ';
}
function terminal_max() {
  export PS1=`echo "$PS1_STORED"`;
}

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

