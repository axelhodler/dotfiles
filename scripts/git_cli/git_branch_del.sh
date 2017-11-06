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
  git branch -D ${branches[$branchid]}
done

~/dotfiles/scripts/git_cli/git_list_branches.sh
