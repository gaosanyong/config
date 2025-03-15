
# history expansion 
export HISTCONTROL=eraseups:ignorespace
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=10000
export HISTIGNORE='history*:ls*'
export HISTSIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S> "

# https://github.com/Wervice/awesome-ps1
export PS1='\[\e[0;38;5;82m\]$ \[\e[0;38;5;45m\]\u \[\e[0;38;5;45m\](\[\e[0;38;5;39m\]\W\[\e[0;38;5;45m\]) \[\e[0;1;38;5;45m\]>\[\e[0m\] '
