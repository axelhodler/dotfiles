#!/bin/sh

set -e

branches=()

read_branches() {
  while read branch
  do
    branchname=$(echo "$branch" | sed -e "s#^.*[[:space:]]##g")
    branches+=("$branchname")
  done <<< "`git branch`"
}

read_branches

for branchid in "$@"
do
  git branch -d ${branches[$branchid]}
done
