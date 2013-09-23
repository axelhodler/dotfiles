# Executes commands at the start of an interactive session

alias xright='xrandr --output VGA1 --mode 1920x1080 --right-of LVDS1'
alias xleft='xrandr --output LVDS1 --mode 1600x900 --left-of VGA1'
alias gis='git status --short'
alias gia='git add'
alias gic='git commit -m'
# keymapstuff
alias ger='setxkbmap -option grp:alt_shift_toggle "de,us"'
alias geroff='setxkbmap -option'
alias gofli='cd workspace/jTakt1 && mvn exec:java -Dexec.mainClass="earth.xor.Main"'
alias s='sudo'
alias dual='xrandr --output LVDS1 --off --output HDMI1 --crtc 0 --mode 1920x1080 --right-of VGA1'