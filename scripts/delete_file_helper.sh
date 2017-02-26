#!/bin/sh

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

for filenumber in "$@"
  do
    rm -r ${files[$filenumber]}
  done
