#
# Commands at login pre-zsh
#

# run startx after login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
