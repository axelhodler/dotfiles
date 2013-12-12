[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# setxkbmap -option grp:alt_shift_toggle "de,us"
# setxkbmap -option  # resets the layout options
feh --bg-scale ~/bg.jpg
xset b off

numlockx &
# should actually done by systemd user sessions but idc yet
mpd &
exec i3
