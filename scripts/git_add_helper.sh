#!/bin/bash

files=()

# gather files
while read line; do
  filename=$(echo "$line" | sed -e "s#^.*[[:space:]]##g")
  files+=("$filename")
done < <(git status --porcelain)

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
