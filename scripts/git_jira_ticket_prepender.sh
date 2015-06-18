#!/bin/bash

commit_msg="$@"
echo $commit_msg

branchname=$(git rev-parse --abbrev-ref HEAD)

# if branches are called feature/relution/MDM-1337
ticketid=$(echo $branchname | cut -f2 -d"/")

git commit -m "$ticketid: $commit_msg"
