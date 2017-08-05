#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


WHITE=$(tput setaf 7)
RED=$(tput setaf 197)
ORANGE=$(tput setaf 208)
BLUE=$(tput setaf 045)
GREEN=$(tput setaf 148)


PS1='\[${WHITE}\][\[${RED}\]\u\[${WHITE}\]@\[${BLUE}\]\h \[${GREEN}\]\W\[${WHITE}\]]\[${ORANGE}\]\$\[${WHITE}\] '

# ---------------------------- ALIASES ------------------------------------

# ----- Pretty colours -----
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ------ Safety features -----
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ------ Pacman stuff -----
# Synchronize with repositories before upgrading packages
alias pacup='sudo pacman -Syu'        
# Install specific package(s) from the repositories
alias pacin='sudo pacman -S'           
# Remove orphan packages
alias paccl='sudo pacman -Rns $(pacman -Qtdq)'
# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacre='sudo pacman -R'           
# Search for package(s) in the repositories
alias pacrse='pacman -Ss' 
# Search for package(s) in the local database
alias paclo='pacman -Qs' 
# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrem='sudo pacman -Rns'        

# ------ Other stuff -----
alias systemctl-list='systemctl list-unit-files'
