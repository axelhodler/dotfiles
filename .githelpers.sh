#!/bin/sh

HASH="%C(yellow)%h%C(reset)"
RELATIVE_TIME="%C(green)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset)"
REFS="%C(red)%d%C(reset)"
SUBJECT="%s"

FORMAT="$HASH{$RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

function pretty_git_log() {
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s '{' |
  less -FXRS
}
