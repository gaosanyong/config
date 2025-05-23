# The .inputrc file is a configuration file used by the GNU Readline library, 
# which provides line editing and history capabilities for many command-line 
# applications, including Bash.

# Respect default shortcuts.
$include /etc/inputrc

# Allow history search by prefix
"\e[A":history-search-backward # arrow up
"\e[B":history-search-forward  # arrow down
