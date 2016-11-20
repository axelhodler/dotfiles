#!/bin/bash

if ! hash trash 2>/dev/null; then
  echo "run npm install -g trash trash-cli first to install necessary dependencies"
  exit 1
fi

files=()

source ~/dotfiles/scripts/git_helper_statusreader.sh

for filenumber in "$@"
  do
    trash ${files[$filenumber]}
  done
