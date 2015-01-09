#!/bin/bash

files=()

# gather files
while read line; do
  filename=$(echo "$line" | sed -e "s#^.*[[:space:]]##g")
  files+=("$filename")
done < <(git status --porcelain)

# add chosen files
for filenumber in "$@"
  do
    git add ${files[$filenumber]}
  done
