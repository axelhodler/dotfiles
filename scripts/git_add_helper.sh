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
# user wants to add all with patch
elif [[ "$2" == "." ]]; then
  git add -p .
# check which files to add
else
  for filenumber in "$@"
  do
    if [[ $filenumber = "-p" ]]; then
      continue
    fi

    if [[ "$patch" = true ]]; then
      git add -p ${files[$filenumber]}
    else
      git add ${files[$filenumber]}
    fi
  done
fi

~/dotfiles/scripts/git_status_helper.sh
