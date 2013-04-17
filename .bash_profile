alias clearswp="find . -name ".*.swp" | xargs rm -f"

# Combines 'cd' and 'ls' into a single command
function cds(){
  cd $1;
  ls;
}

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

