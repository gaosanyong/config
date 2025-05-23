# This is the config file loaded by interactive login shell. 
# This file is to be symlinked to ~/.bash_profile to take effect. 

# load ~/.bashrc
if [[ -f ~/.bashrc ]]; then 
  source ~/.bashrc 
fi

# history expansion 
export HISTCONTROL=eraseups:ignorespace
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=10000
export HISTIGNORE='history*:ls*'
export HISTSIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S> "

# https://github.com/Wervice/awesome-ps1
export PS1='\[\e[0;38;5;82m\]$ \[\e[0;38;5;45m\]\u \[\e[0;38;5;45m\](\[\e[0;38;5;39m\]\W\[\e[0;38;5;45m\]) \[\e[0;1;38;5;45m\]>\[\e[0m\] '

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/opt/homebrew/Cellar/ripgrep/14.1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"

export VISUAL=nvim # set system default editor to NeoVim

# export Homebrew environment variables 
# e.g. $PATH contains Homebrew locations
eval "$(/opt/homebrew/bin/brew shellenv)"

caffeinate -d & # keep macOS awake
