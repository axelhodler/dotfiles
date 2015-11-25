#!/bin/bash

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

patch=false

if [[ "$1" == "-p" ]]; then
  patch=true
fi

# add the single file
if [[ ${#files[@]} == 1 && "$patch" = true ]]; then
  git add -p ${files[0]}
elif [[ ${#files[@]} == 1 ]]; then
  git add ${files[0]}
# check which files to add
else
  for filenumber in "$@"
  do
    if [[ "$patch" = true ]]; then
      git add -p ${files[$filenumber]}
    else
      git add ${files[$filenumber]}
    fi
  done
fi
