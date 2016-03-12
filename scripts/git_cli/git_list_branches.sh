#!/bin/sh

BRANCH_COUNT=0

while read branch
  do
    echo "$branch" | sed -e "s|^|[$BRANCH_COUNT] |g"
    (( BRANCH_COUNT++ ))
  done <<< "`git branch -v`"


 
