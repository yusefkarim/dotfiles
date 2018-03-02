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
#alias rm='rm -i'

# ------ Pacman stuff -----
# Synchronize with repositories before upgrading packages
alias pacup='sudo pacman -Syu'
# Install specific package(s) from the repositories
alias pacin='sudo pacman -S'
# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacre='sudo pacman -R'
# Remove/Clean orphan packages
alias paccl='sudo pacman -Rns $(pacman -Qtdq)'
# Search for package(s) in the repositories
alias pacse='pacman -Ss'
# Search for package(s) in the local database
alias paclo='pacman -Qs'
# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrem='sudo pacman -Rns'
# Removes old unused chached packages from /var/cache/pacman/pkg/
alias paccc='sudo pacman -Sc'

# ------ Other stuff -----
alias systemctl-list='systemctl list-unit-files'
alias bup='brightnessctl -q set +15%'
alias bdown='brightnessctl -q set 15%-'
alias zen='sudo openvpn --config ~/Documents/Misc/vpn/zenvpn.ovpn'
alias frost='cd ~/Documents/Misc/vpn && sudo openvpn --config canada.ovpn'
alias fup='source ~/Documents/scripts/fontup.sh'
alias fdown='source ~/Documents/scripts/fontdown.sh'
alias mnt='sudo mount -o uid=$USER,gid=users,fmask=111,dmask=022'
alias pdf='evince'      #Install evince-light from aur
alias wiki='vim ~/Documents/wiki/index.md'

# ------ TM4C123 stuff -----
alias upload='make && sudo make flash'

# ------ Computer Organization - Mars -----
alias mars='cd ~/Documents/trent/computer_organization/; java -Dsun.java2d.uiScale=1.5 -jar ~/Documents/trent/computer_organization/Mars4_5.jar'
# ------ Partial Differential Equations - Maple -----
alias maple='cd ~/Documents/trent/pde/; bash ~/maple2016/bin/xmaple'
