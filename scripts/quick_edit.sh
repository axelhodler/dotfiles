#!/bin/bash

# number regex
re='^[0-9]+$'

if [ -f .gitignore ] && [[ $1 =~ $re ]]; then
  source ~/dotfiles/scripts/git_helper_statusreader.sh
  vi ${files[$1]}
  ~/dotfiles/scripts/git_status_helper.sh
else
  vi $1
fi

