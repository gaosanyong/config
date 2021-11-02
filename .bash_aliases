#user-defined aliases in this file which was imported by .bashrc

#control ls command output
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

#control cd command behavior
alias ..='cd ..'

#control grep command output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#start calculator with math support
alias bc='bc -l'

#create parent directories on demand
alias mkdir='mkdir -pv'

#colorize diff output
#alias diff='colordiff'

#make mount command output pretty
#alias mount='mount | column -t'

#command short cuts
alias h='history | less'
alias untar='tar -zxvf'

#create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias today='date +"%Y-%m-%d"'

#control output of ping
alias ping='ping -c 5'

#resuem wget by default
alias wget='wget -c'

#add safety nets
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#update debian linux server
alias update='sudo apt-get update && sudo apt-get upgrade'

#pass halt/reboot via sudo
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'


