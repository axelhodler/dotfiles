#!/bin/bash

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

for filenumber in "$@"
  do
    # npm install -g trash
    trash ${files[$filenumber]}
  done
