[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# setxkbmap -option grp:alt_shift_toggle "de,us"
# setxkbmap -option  # resets the layout options
feh --bg-scale ~/bg.jpg
xset b off
# disable screen saver blanking
xset s off
xset -dpms

numlockx &
# should actually done by systemd user sessions but idc yet
mpd &
exec i3
