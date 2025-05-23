# This is the bash config file loaded by interactive non-login shell. 
# This should be symlinked by ~/.bashrc to take effect. 

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

eval "$(fzf --bash)" # fzf key bindings & fuzzy completion
eval "$(zoxide init bash)" 

[[ -f ~/.bash_alias    ]] && source ~/.bash_alias
[[ -f ~/.bash_function ]] && source ~/.bash_function 

# set up terminal-based tmux session
if [[ $TERM == alacritty ]]; then 
    : 
elif [[ $TERM == xterm-256color ]]; then 
    if [[ $TERM_PROGRAM != vscode && $TERM_PROGRAM != WezTerm ]]; then 
        if [[ ! $TMUX && -t 0 ]]; then 
            tmux -CC new-session -As main
        fi
    elif [[ $TERM_PROGRAM == WezTerm ]]; then
        :
    fi 
elif [[ $TERM == xterm-ghostty ]]; then 
    : 
elif [[ $TERM == xterm-kitty ]]; then 
    :    
fi
