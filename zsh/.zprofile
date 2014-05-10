#
# Commands at login pre-zsh
#
export GOPATH=$HOME/go
PATH="${PATH}:${GOPATH}/bin"
PATH="${PATH}:/home/xorrr/.gem/ruby/2.1.0/bin"
export PATH

# run startx after login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

if [ -n "$DISPLAY" ]; then
    BROWSER=conkeror
fi
