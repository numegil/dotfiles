alias clearswp="find . -name ".*.swp" | xargs rm -f"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

