#!/bin/bash

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

patch=false

# add chosen files
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
