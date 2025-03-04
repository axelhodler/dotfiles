#!/bin/sh

files=()

source ~/devel/github/axelhodler/dotfiles/scripts/git_helper_statusreader.sh

for filenumber in "$@"
  do
    rm -r ${files[$filenumber]}
  done
