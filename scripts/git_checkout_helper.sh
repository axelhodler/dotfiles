#!/bin/bash

files=()

source ~/devel/github/axelhodler/dotfiles/scripts/git_helper_statusreader.sh

# add chosen files
for filenumber in "$@"
  do
    git checkout -- ${files[$filenumber]}
  done

~/devel/github/axelhodler/dotfiles/scripts/git_status_helper.sh
