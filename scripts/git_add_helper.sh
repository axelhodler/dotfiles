#!/bin/bash

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

patch=false

# add the single file
if [[ ${#files[@]} == 1 ]]; then
  git add -p ${files[0]}
# check which files to add
else
  for filenumber in "$@"
  do
    if [[ "$patch" = true ]]; then
      git add -p ${files[$filenumber]}
    elif [[ "$1" == "-p" ]]; then
      patch=true
    else
      git add ${files[$filenumber]}
    fi
  done
fi
