# user-defined aliases (imported by .bashrc)

# drop-in replacement
alias cat=bat
alias cd=z
alias grep=rg
alias ls='eza --icons=always'

# control cd command behavior
alias ..='cd ..'

# start calculator with math support
alias bc='bc -l'

# create parent directories on demand
alias mkdir='mkdir -pv'

# command short cuts
alias h='history | less'
alias untar='tar -zxvf'

# create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias today='date +"%Y-%m-%d"'

# control output of ping
alias ping='ping -c 5'

# resuem wget by default
alias wget='wget -c'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Meta specific
alias jfd='jf submit --draft'
alias ssh='x2ssh -et'
alias tt=taste-tester
