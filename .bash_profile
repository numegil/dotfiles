alias clearswp="find . -name ".*.swp" | xargs rm -f"

export EDITOR="vim"

# Combines 'cd' and 'ls' into a single command
function cds(){
  cd $1;
  ls;
}

# Provides an alias to get minimize terminal prompt
alias terminal_min="export PS1='> '"
alias terminal_max="source ~/.bash_profile"

# Combine history between multiple terminals
HISTSIZE=9000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
history() {
  _bash_history_sync
  builtin history "$@"
}
_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}
PROMPT_COMMAND=_bash_history_sync

# source ~/.bashrc and ~/.bash_profile_local if they exist
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

